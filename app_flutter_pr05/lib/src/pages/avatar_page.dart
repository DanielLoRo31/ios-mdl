import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page')
      ),
      body: Center(
        child: Icon(Icons.ac_unit)
      ),
    );
  }
}