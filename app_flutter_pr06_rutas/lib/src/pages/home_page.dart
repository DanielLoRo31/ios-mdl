import 'package:app_flutter_pr06_rutas/src/providers/menu_provider.dart';
import 'package:app_flutter_pr06_rutas/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // Future Builder
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          // final route = MaterialPageRoute(
          //   builder: (context) => getPage(opt['ruta'], opt['data'])
          //   // builder: (context) => AlertPage(opt['data'])
          // );
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      options..add(widgetTemp)..add(Divider());
    });
    return options;
  }
}
