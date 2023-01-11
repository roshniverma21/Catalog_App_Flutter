import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/store.dart';
import '../model/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.canvasColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "Cart".text.make(),
        ),
        body: Column(
          children: [
            _CartList().p32().expand(),
            // placeholder- this is used to show that this space is being used for something and is used in designing of app phrase
            const Divider(),
            _CartTotal(),
          ],
        ));
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

          //here when item is removed from cart we want to change the price so we cant build teh whole widget so we will use
          //VxBuilder(jaha bhi apko state access krni hai voh deta hai),
          //VxNotifier(jaha apko context chahiye ho navigation, toast, ya snackbar ki need ho )
          //VxConsumer(mixture of both)
        children: [
          VxBuilder(
              mutations: const {RemoveMutation},
              builder: (context,_,status) {
              return "\Rs. ${_cart.totalPrice}".text.xl5
                  .color(context.theme.accentColor)
                  .make();
              },
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buying not supported yet.".text.make(),
              ));
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor)),
            child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //when this is written this will draw the widget tree aghain
    VxState.watch(context, on: [RemoveMutation]);//this will work only for removing mutatio
  final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items?.length == 0
        ? "Nothing to show".text.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () =>
                  RemoveMutation((_cart.items[index]));
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}

