import 'package:flutter/material.dart';

class ConteoPage extends StatefulWidget {
  @override
  createState() {
    return _ConteoPageState();
  }
}

class _ConteoPageState extends State<ConteoPage> {
  final _estilo = new TextStyle(fontSize: 30);
  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Aquí va el titulo'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('clocks', style: _estilo),
              Text('$_conteo', style: _estilo)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            child: Text('-'),
            onPressed: () {
              setState(() {
                _conteo--;
              });
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                _conteo++;
              });
            },
          ),
        ]));
  }
}
