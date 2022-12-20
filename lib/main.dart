import 'package:flutter/material.dart';

import 'dart_basics.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: dart_basics()
    );
    
  }
}


