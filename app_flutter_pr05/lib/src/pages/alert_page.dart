import 'package:app_flutter_pr05/src/utils/icon_string_util.dart';
import 'package:app_flutter_pr05/src/utils/page_string_util.dart';
import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  List<dynamic> _data = [];

  AlertPage(data) {
    _data = data != null ? data : [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page')
      ),
      body: _lista(context),
    );
  }

  Widget _lista(BuildContext context) {
    return ListView(
        children: _listaItems(context),
    );
  }

  List<Widget> _listaItems(BuildContext context) {
    final List<Widget> options = [];

    _data.forEach((opt) {
      final widgetTemp = ListTile(
            title: Text(opt['texto']),
            leading: getIcon(opt['icon']),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){
              final route = MaterialPageRoute(
                builder: (context) => getPage(opt['ruta'], opt['data'])
              );
              Navigator.push(context, route);
            },
          );
          options..add(widgetTemp)..add(Divider());
    });
    return options;
  }
}