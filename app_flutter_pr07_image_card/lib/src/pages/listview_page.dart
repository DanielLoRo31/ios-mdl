import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // nos servira para agregar elementos (imagenes a nuestro listView)

  List<Map<String, int>> _ListaNumeros = new List();
  ScrollController _scrollController = new ScrollController();
  int _ultimoItem = 0;
  bool _isLoading = false;

  int decimal = 0;

  @override
  void initState() {
    super.initState();

    agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lisas'),
      ),
      body: Stack(
        children: <Widget>[_crearLista(), _crearLoading()],
      ),
    );
  }

  Widget _crearLista() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _ListaNumeros.length, //Cantidad de items que se desea cargar
      itemBuilder: (BuildContext context, int index) {
        final imagen = _ListaNumeros[index]['item'];
        var str = '';
        switch (_ListaNumeros[index]['type']) {
          case 0:
            str = '';
            break;
          case 1:
            str = 'grayscale&&';
            break;
          case 2:
            str = 'blur&&';
            break;
          default:
            break;
        }
        return FadeInImage(
          image: NetworkImage(
              'https://picsum.photos/500/300/?$str' + 'image=$imagen'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        );
      },
    );
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});
    final duracion = new Duration(seconds: 3);
    return new Timer(duracion, responseHTTP);
  }

  void responseHTTP() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 150,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));

    agregar10();
  }

  void agregar10() {
    if (decimal < 2) {
      decimal++;
    } else {
      decimal = 0;
    }

    for (var i = 0; i < 10; i++) {
      // _ultimoItem++;
      // _ListaNumeros.add({'item': _ultimoItem++, 'type': decimal});
      _ListaNumeros.add({'item': i, 'type': decimal});
      setState(() {});
    }
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          )
        ],
      );
    }
    return Container();
  }
}
