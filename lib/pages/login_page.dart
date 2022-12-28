import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      // child: Text(
      //   "Login Page",
      //   style: TextStyle(
      //     fontSize: 40, //this makes it unresponsive
      //     color: Colors.blue
      //     ),
      //     textScaleFactor: 2.0,//to increase the text size by double
      // ),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/login_page.png", fit: BoxFit.cover),
            //fit: BoxFit.
            //1. cover - crop kr dega but pura mast ayega
            //2. fill - bhar dega without cropt kare image ko
            //3. scale down - size kam kr dega
            //4. cointained
            //5. fitHeight

            const SizedBox(height: 20),

            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 24, //this makes it unresponsive
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
              child: Column(children: [
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Enter username", labelText: 'Username'),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: "Enter password", labelText: 'Password'),
                ),
              ]),
            ),

            ElevatedButton(
              child: Text("login"),
              style: TextButton.styleFrom(minimumSize: Size(150, 40)),
              onPressed: () {
                Navigator.pushNamed(context, MyRoute.homeRoute);
              },
            )
          ],
        ),
      ),
    );
  }
}
