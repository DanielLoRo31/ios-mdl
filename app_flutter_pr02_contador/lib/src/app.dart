import 'package:flutter/material.dart';
// import 'pages/home_page.dart';
import 'pages/conteo_page.dart';

class MyApp extends StatelessWidget{
  Widget build(context) {
    return MaterialApp(
      home: Center (
        child: ConteoPage(),
      ),
    );
  }
}