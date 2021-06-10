import 'dart:convert';

import 'package:formvalidation/src/models/product_model.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';
import '../models/product_model.dart';
import '../models/product_model.dart';
import '../models/product_model.dart';

class ProductosProvider{
  final String _url = 'https://flutterdb-15ae7-default-rtdb.firebaseio.com';

  Future<bool> crearProducto(ProductModel producto) async{
    final url = Uri.http(_url, '/productos.json');

    final resp = await http.post(url,body: productModelToJson(producto));

    final decodeData = json.decode(resp.body);

    print(decodeData);

    return true;

  }

  Future<bool> editarProducto(ProductModel producto) async {
    final url = Uri.http(_url, '/productos/${producto.id}.json');

    final resp = await http.put(url, body: productModelToJson(producto));

    final decodeData = json.decode(resp.body);

    print(decodeData);
    return true;

  }

  Future<int> borrarProducto(String id) async {
    final url = Uri.http(_url, '/productos/$id.json');

    final resp = await http.delete(url);

    print(json.decode(resp.body));

    return 1;
  }

  Future<List<ProductModel>> traetProductos() async {
    final url = Uri.http(_url, '/productos.json');

    final resp = await http.get(url);

    final Map<String, dynamic> decodeData = json.decode(resp.body);

    final List<ProductModel> productos = new List();

    if (decodeData == null) return [];

    decodeData.forEach((id, prod) {
      final prodTemp = ProductModel.fromJson(prod);
      prodTemp.id = id;
      productos.add(prodTemp);
    });

    return productos;
  }
}