import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page")
      ),
      body : Center(
        child: Container(
          child : Text("Hi"),
        ),
      ),
      drawer: Drawer()
      );
  }

   // methods = class ek ander
   // here if value is not passed during calling then it takes default value as 100
  bringVegetables({int rupees = 100}){
    
  }

  //here whil ecalling this method it is compulsory to pass paramteer also 
  bringVeggies({required bool polybag}){

  }
}

// functions = class ke bahar
// fucntiona nd method names are in camelCase and class name is PascelCase

