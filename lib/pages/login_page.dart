import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

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
                  onChanged: (value) {
                    name = value;
                    setState(() {
                      //this will call build method again and UI will change
                    });
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: "Enter password", labelText: 'Password'),
                ),
              ]),
            ),

            //button with animation
//container does not have clickable property so we have to wrap them with 1. Inkwell (it has a ripple effect means jab press kare toh pta laeg button press hua ) and ink and inkwell are used tor 2. Just a detector(it does not give any feedback and have no UI/ripple effect/ tap ni diktat)
            InkWell(
              onTap: () async {
                setState(() {
                  changeButton = true;
                });
                await Future.delayed(Duration(seconds: 1));
                Navigator.pushNamed(context, MyRoute.homeRoute);
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: changeButton ? 50 : 150,
                height: 50,
                alignment: Alignment.center,
                child: changeButton
                    ? Icon(
                  Icons.done,
                  color: Colors.white,
                )
                    : Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                ),
              ),
            ),
            // ElevatedButton(
            //   child: Text("login"),
            //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
            //   onPressed: () {
            //     Navigator.pushNamed(context, MyRoute.homeRoute);
            //   },
            // )
          ],
        ),
      ),
    );
  }
}