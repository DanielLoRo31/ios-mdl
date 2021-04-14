//import 'package:componentes/src/pages/homepage_alternativo.dart';
import 'package:flutter/material.dart';

import 'src/pages/alert_page.dart';
import 'src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'listTile APP',
      debugShowCheckedModeBanner: false,
      //home:HomePage(),
      initialRoute: '/',
      routes: getAplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        print('Ruta : ${settings.name}');
        // Si en caso la ruta no existe puedo redireccionar a una que sea estatica
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
