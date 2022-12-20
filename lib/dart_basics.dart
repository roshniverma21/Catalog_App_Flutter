import 'package:flutter/material.dart';

class dart_basics extends StatelessWidget {
  int days = 30;
  String name = "Rosh";
  double pie = 3.14;
  bool isFemale = true;
  num temp = 60.4; //can take int and double also
  var day = "Tuesday"; // can take any value
  static const pi =
      3.14; //value will never change suppose list hai voh modify nhi hogi
  final arr = [
    1,
    2
  ]; //data can be modified suppose list hai usme data add ho jayega

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalog app")),
      body: Center(
        child: Column(children: <Widget>[
          Text(
              "welcome to $name "), // this is called string interpolation as we have added data in string
          Text("welcome to $days "),
          Text(
              "welcome to ${days} "), // if suppose we ahd object here toh hum curly braces use krte but agar ek hi cheez hai toh dollar
          Text("welcome to " + name + " mall"),
          Text("welcome to $isFemale is $temp and $day and ${5}"),
        ]),
      ),
      drawer: Drawer(),
    );
  }
}
