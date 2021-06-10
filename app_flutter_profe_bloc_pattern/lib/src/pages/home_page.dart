import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';

import '../models/product_model.dart';
import '../providers/productos_provider.dart';

class HomePage extends StatelessWidget {
  final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
        onPressed: () => Navigator.pushNamed(context, 'producto'));
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: productosProvider.traetProductos(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final List<ProductModel> productos = snapshot.data;
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, index) =>
                _crearItem(context, productos[index]),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductModel producto) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.redAccent,),
      onDismissed: (direccion) {
        productosProvider.borrarProducto(producto.id);
      },
      child: ListTile(
        title: Text('${producto.titulo} - ${producto.valor}'),
        subtitle: Text('${producto.id}'),
        onTap: () => Navigator.pushNamed(context, 'producto', arguments: producto),
      ),
    );
  }
}
