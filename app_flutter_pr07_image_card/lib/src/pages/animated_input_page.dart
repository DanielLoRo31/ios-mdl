import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedInputPage extends StatefulWidget {
  @override
  _AnimatedInputPageState createState() => _AnimatedInputPageState();
}

class _AnimatedInputPageState extends State<AnimatedInputPage> {
  int _contador = 0;
  String _nombre = '';
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.green[600];

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs personalizados'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        children: <Widget>[_crearInput(), Divider(), _contenedor()],
      ),
    );
  }

  Widget _contenedor() {
    return Center(
        child: AnimatedContainer(
      width: _width,
      height: _height,
      decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ));
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text('caracteres $_contador'),
        hintText: 'Nombre completo',
        labelText: 'nombre',
        helperText: 'solo letras',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onChanged: (valor) {
        // setState(() {
        //   _nombre = valor;

        // });
        _cambiarForma(valor);
      },
    );
  }

  Widget _repintar() {
    return ListTile(title: Text('Su nombre es: $_nombre'));
  }

  void _cambiarForma(String cadena) {
    final random = Random();
    setState(() {
      _contador = cadena.length;
      if (cadena.length % 10 == 0) {
        _width = 100;
        _height = 100;
        _color = Colors.red;
        _borderRadius = BorderRadius.circular(300);
      } else {
        // var aux = random.nextInt(200).toDouble();
        _width = random.nextInt(6).toDouble() * 50;
        _height = random.nextInt(6).toDouble() * 50;
        _color = Color.fromRGBO(
            random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
        _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());

      }
    });
  }
}
