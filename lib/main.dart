import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: home_page(), we have given in route "/" so thsi is homepage toh yaha dene ki need nhi do do jagah
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryTextTheme: GoogleFonts.latoTextTheme()
        ),
      debugShowCheckedModeBanner: false,
      //themeMode: ThemeMode.dark,
      //darkTheme: ThemeData(brightness: Brightness.dark),

      // Routes = raste to which page you want to open and they are already defined eg metro me red, blue lines
      /*
        1. initial Route:
        2. onUnknownRoute - if route is not found
        3. onGenerateRoute - generate the route 
        4. onGenerateInitialRoutes
        example: "/" this is home route
        */
      // initialRoute: "/login", // to make the application to display thsi page at first
      // routes: {
      //   "/": (context) => LoginPage(),
      //   "/login": (context) => LoginPage(),
      // },
      initialRoute: "/login",
      routes: {
        "/": (context) => const HomePage(),
        "/login": (context) => const LoginPage()
      },
    );
  }
}
