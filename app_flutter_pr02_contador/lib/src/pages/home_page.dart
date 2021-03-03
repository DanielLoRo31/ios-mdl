import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final estilo = new TextStyle(fontSize: 30);

  final conteo = 15;

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Aquí va el titulo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('clicks', style: estilo),
            Text('$conteo', style: estilo)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          print('la apretaste');
        },
      ),
    );
  }
}