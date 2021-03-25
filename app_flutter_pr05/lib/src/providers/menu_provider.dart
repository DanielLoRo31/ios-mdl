import "package:flutter/services.dart" show rootBundle;
import "dart:convert";

class _MenuProvider {
  List<dynamic> options = [];

  _MenuProvider() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final res = await rootBundle.loadString('data/menu_opt.json');
    Map dataMap = json.decode(res);
    options = dataMap['rutas'];
    return options;
  }
}

final menuProvider = new _MenuProvider();