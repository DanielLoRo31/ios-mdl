import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page')
      ),
      body: ListView(
        children: <Widget>[
          _cardT1()
        ],
      ),
    );
  }

  Widget _cardT1() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.assistant_photo, color: Colors.cyanAccent),
            title: Text('Buenos Días'),
            subtitle: Text('Lorem Ipsum'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Aceptar'),
                onPressed: (){}
                ),
                FlatButton(
                child: Text('Cancelar'),
                onPressed: (){}
                )
            ]
          )
        ],
      ),
    );
  }
}