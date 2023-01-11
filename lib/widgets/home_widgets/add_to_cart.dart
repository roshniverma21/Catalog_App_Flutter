import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/store.dart';
import '../../model/cart.dart';
import '../../model/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    required this.catalog,
  });

  @override
  Widget build(BuildContext context) {
    //keep all business logic in mutation
    //add is when item added in cart and remove is when item removed from so that the tick can be back to normal cart icon
      VxState.watch(context, on: [AddMutation, RemoveMutation]); //mutation is action performed
      final CartModel _cart = (VxState.store as MyStore).cart;
      bool isInCart = _cart.items.contains(catalog) ?? false;
      return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalog);
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            )),
        child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
      );
    }
  }
