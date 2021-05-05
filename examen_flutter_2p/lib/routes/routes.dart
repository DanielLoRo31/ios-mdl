import 'package:examen_flutter_2p/pages/login_page.dart';
import 'package:examen_flutter_2p/pages/menu_page.dart';
import 'package:examen_flutter_2p/pages/operation_page.dart';
import 'package:examen_flutter_2p/pages/ordername_page.dart';
import 'package:examen_flutter_2p/pages/random_page.dart';
import 'package:flutter/material.dart';

Map <String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    'menu' : (BuildContext context) => MenuPage(),
    'operation' : (BuildContext context) => OperationPage(),
    'order_name' : (BuildContext context) => OrderNamePage(),
    'random' : (BuildContext context) => RandomPage(),
  };
}