//import 'package:componentes/src/pages/homepage_alternativo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/pages/alert_page.dart';
import 'src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('en', 'US'), const Locale('es', 'ES')],
      title: 'listTile APP',
      debugShowCheckedModeBanner: false,
      //home:HomePage(),
      initialRoute: '/',
      routes: getAplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        // print('Ruta : ${settings.name}');
        // Si en caso la ruta no existe puedo redireccionar a una que sea estatica
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
