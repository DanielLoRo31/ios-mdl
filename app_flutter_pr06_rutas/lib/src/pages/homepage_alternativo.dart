import 'package:flutter/material.dart';

class HomePageAlternativo extends StatelessWidget {
  
  final opciones = [
    {"title": "Uno", "description": "Description 1", "style": new TextStyle(fontSize: 10, color: Colors.white), "leading": Icons.account_balance_outlined, "trailing": Icons.keyboard_arrow_right, "tileColor": Colors.amber},
    {"title": "Dos", "description": "Description 2", "style": new TextStyle(fontSize: 15, color: Colors.white), "leading": Icons.ac_unit , "trailing": Icons.keyboard_arrow_right, "tileColor": Colors.blue},
    {"title": "Tres", "description": "Description 3", "style": new TextStyle(fontSize: 20, color: Colors.white), "leading": Icons.audiotrack, "trailing": Icons.keyboard_arrow_right, "tileColor": Colors.lime},
    {"title": "Cuatro", "description": "Description 2", "style": new TextStyle(fontSize: 25, color: Colors.white), "leading": Icons.android, "trailing": Icons.keyboard_arrow_right, "tileColor": Colors.grey},
    {"title": "Cinco", "description": "Description 3", "style": new TextStyle(fontSize: 30, color: Colors.white), "leading": Icons.accessibility_new, "trailing": Icons.keyboard_arrow_right, "tileColor": Colors.teal},
    {"title": "Seis", "description": "Description 4", "style": new TextStyle(fontSize: 35, color: Colors.white), "leading": Icons.add_ic_call , "trailing": Icons.keyboard_arrow_right, "tileColor": Colors.red}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('listTile'),
      ),
      body: ListView(children: _crearItemsCorto()),
    );
  }

  List<Widget> _crearItemsCorto() {
    return opciones.map((opt) {
      return Column(
        children: [
          ListTile(
            title: Text((opt['title'].toString() + ' *'), style: opt['style']),
            subtitle: Text(opt['description']),
            leading: Icon(opt['leading']),
            trailing: Icon(opt['trailing']),
            tileColor: opt['tileColor'],
            hoverColor: Colors.limeAccent,
            onTap: (){},
          ),
        ],
      );
    }).toList();
  }
}
