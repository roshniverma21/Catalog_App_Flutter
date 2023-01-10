import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../model/catalog.dart';
import '../../pages/home_detail_page.dart';
import '../theme.dart';
import 'catalog_image.dart';

class CatalogList extends StatefulWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  State<CatalogList> createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(
                  catalog: catalog,
                ),
            ),
          ),
          child: CatalogItem(catalog:catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),//connect two particular things for transition jese ek page se dusre page por
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
                  catalog.desc.text.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\Rs.${catalog.price}".text.bold.xl.make(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                            shape: MaterialStateProperty.all(StadiumBorder()
                            )),
                        child: "Buy".text.make(),
                      )
                    ],
                  ).pOnly(right: 8.0)
                ],
              ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}