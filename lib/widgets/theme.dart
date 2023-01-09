import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// here we can add 1. appbar Theme in particulatr page
// 2.in another class as widget and then use it everywhere
// 3. Define in that page for customisation.
// yaha humne class banan li usme widgets daal diye and then we can use it everywhere

class MyTheme {
  static ThemeData lightTheme(BuildContext context) =>
      ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.poppins().fontFamily,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            textTheme: Theme
                .of(context)
                .textTheme,
          )
      );


  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(
         brightness: Brightness.dark,
      );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
}
