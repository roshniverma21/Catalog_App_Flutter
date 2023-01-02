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
  void initState() {//take the data here and pass irt into build method
    super.initState();
    loadData();//this will take all data pehle hi widget ke
  }
  loadData() async {
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");//this file will return future means it will take time to retrive
    //now we have got the json object in form of string but we need in object so we will decode the file
    //after decoding it will give it in form of map (dynamic value) (string to another dynamic format)
    //same way we have encoding (dynamic another format to string)
    //map - key value pair)
    var decodedData = jsonDecode(catalogJson);
    //we only need products toh uski key pass krdo
    var productData = decodedData["products"];
    //now map this data with catalog model

  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(30, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page",style: const TextStyle(
        color: Colors.black
      ),
      ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}


// the first curly braces represent json object
// second product is called as key and it has a array of json objects

