import 'package:app_flutter_pr01/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) { //context return widget
    return MaterialApp(
      home: Center(
        child: HomePage(),
      ),
    );
  }
}