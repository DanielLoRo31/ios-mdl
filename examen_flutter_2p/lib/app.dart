import 'package:examen_flutter_2p/pages/login_page.dart';
import 'package:examen_flutter_2p/routes/routes.dart';
import 'package:flutter/material.dart';

import 'config/palette.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Palette.lightBlack,
        accentColor: Palette.lightGreen,
        primaryColor: Palette.blackBg,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getApplicationRoutes(),
      title: 'Exam 2',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginPage(),
        );
      },
    );
  }
}
