import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 1'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hola Mundo:',
            ),
            Text(
              'Hola Mundo 2:',
            ),
            Text(
              'Hola Mundo 3:',
            ),
          ],
        ),
      )

    );
  }
}
