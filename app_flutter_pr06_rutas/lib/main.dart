import 'package:app_flutter_pr06_rutas/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'src/pages/alert_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListTile APP',
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: '/',
      routes: getAplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        print('Ruta: ${settings.name}');
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
