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

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async{
    //form will be validated over here if it has validation error
    // it will throw error else will execute this block
    if(_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoute.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/Login2.png", fit: BoxFit.cover),
               const SizedBox(height: 10),

              Text(
                "Welcome $name",
                style: const TextStyle(
                  fontSize: 24, //this makes it unresponsive
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                child: Column(children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Enter username",
                        labelText: 'Username'
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username cannot be empty";
                      } else {
                        return null;
                      }
                    },
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
                          hintText: "Enter password",
                          labelText: 'Password'
                      ),
                      validator: (value){
                      if(value!.isEmpty) {
                        return "Password cannot be empty";
                      } else if(value.length < 6 ) {
                        return "Password length should be atleast 6";
                      } else {
                        return null;
                      }
                  }
                  ),
                ]),
              ),

              //button with animation
              //container does not have clickable property so we have to wrap
              // them with 1. Inkwell (it has a ripple effect means jab press
              // kare toh pta lage button press hua ) and ink and inkwell are
              // used tor 2. Just a detector(it does not give any feedback and
              // have no UI/ripple effect/ tap ni diktat)
              Material(
                color: Colors.deepPurple,
                borderRadius:
                BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: changeButton ? 50 : 150,
                    height: 50,
                    alignment: Alignment.center,
                    child: changeButton
                        ? const Icon(
                      Icons.done,
                      color: Colors.white,
                    )
                        : const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

