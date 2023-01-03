import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/items_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // lifecycle of widget is very much important in flutter so we need to maintain states
  // especially of stateful widgets ki ab start hue, over hue , etc
  // this is a place where widget is not created as build method call is nto made
  @override
  void initState() {
    //take the data here and pass irt into build method
    super.initState();
    loadData(); //this will take all data pehle hi widget ke
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString(
        "assets/files/catalog.json"); //this file will return future means it will take time to retrive
    //now we have got the json object in form of string but we need in object so we will decode the file
    //after decoding it will give it in form of map (dynamic value) (string to another dynamic format)
    //same way we have encoding (dynamic another format to string)
    //map - key value pair)
    var decodedData = jsonDecode(catalogJson);
    //we only need products toh uski key pass krdo
    var productData = decodedData["products"];
    //now map this data with catalog model

    //now we need to make a list to get the products to convert it into list of items
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? ListView.builder(
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) => ItemWidget(
                  item: CatalogModel.items[index],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}

// the first curly braces represent json object
// second product is called as key and it has a array of json objects
