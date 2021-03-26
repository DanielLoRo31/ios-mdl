import 'package:app_flutter_pr06_rutas/src/pages/alert_page.dart';
import 'package:app_flutter_pr06_rutas/src/pages/avatar_page.dart';
import 'package:flutter/material.dart';

List<dynamic> _data = [];

Widget getPage(String pageName, List<dynamic> data) {
  _data = new List<dynamic>();
  _data = data;
  final _pages = returnPage();
  return _pages[pageName];
}

Map<String, Widget> returnPage() {
  return {
    'alert' : new AlertPage(),
    'avatar' : new AvatarPage(),
    'card' : new AlertPage()
  };
}