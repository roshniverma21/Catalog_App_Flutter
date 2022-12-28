import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page")
      ),
      body : const Center(
        child: Text("Hi"),
      ),
      drawer: const Drawer()
      );
  }

   // methods = class ke ander
   // here if value is not passed during calling then it takes default value as 100
  bringVegetables({int rupees = 100}){
    
  }

  //here whil ecalling this method it is compulsory to pass paramteer also 
  bringVeggies({required bool polybag}){

  }
}

// functions = class ke bahar
// function and method names are in camelCase and class name is PascelCase

