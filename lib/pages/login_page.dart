import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Text(
        "Login Page",
        style: TextStyle(
          fontSize: 40, //this makes it unresponsive
          color: Colors.blue
          ),
          textScaleFactor: 2.0,//to increase teh text size by double
      ),
    );
  }
}
