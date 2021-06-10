import 'package:blocpattern/src/bloc/provider.dart';
import 'package:blocpattern/src/models/producto_model.dart';
import 'package:blocpattern/src/providers/productos_provider.dart';
import 'package:flutter/material.dart';

import '../models/producto_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<ProductoModel>> productFuture;
  ScrollController _scrollController = new ScrollController();
  final productosProvider = new ProductosProvider();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if ((_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) ||
          (_scrollController.position.pixels ==
              _scrollController.position.minScrollExtent)) {
        fetchData();
      }
    });
  }

  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),
    );
  }

  Future<Null> fetchData() async {
    productFuture = productosProvider.cargarProductos();
    setState(() {});
  }

  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'producto'),
    );
  }

  Widget _crearListado() {
    productFuture = productosProvider.cargarProductos();
    return FutureBuilder(
      future: productFuture,
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;

          return ListView.builder(
              controller: _scrollController,
              itemCount: productos.length,
              itemBuilder: (contex, i) => _crearCard(context, productos[i]));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearCard(BuildContext context, ProductoModel producto) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (direccion) {
          productosProvider.borrarProducto(producto.id);
        },
        child: Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 20.0, top: 5.0),
            width: MediaQuery.of(context).size.width - 20,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    title: Text('${producto.titulo} -${producto.valor}'),
                    subtitle: Text(producto.id),
                    /* onTap: ()=>Navigator.pushNamed(context, 'producto'), */
                    onTap: () => Navigator.pushNamed(context, 'producto',
                        arguments: producto),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: (producto.fotoUrl == null)
                      ? Image(
                          image: AssetImage('assets/no-image.png'),
                          fit: BoxFit.cover,
                        )
                      : FadeInImage(
                          image: NetworkImage(producto.fotoUrl),
                          placeholder: AssetImage('assets/jar-loading.gif'),
                          fit: BoxFit.cover,
                        ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(0.0, 4.0))
                ],
                color: Colors.white),
          ),
        ));
  }

  Widget _crearItem(BuildContext context, ProductoModel producto) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (direccion) {
          productosProvider.borrarProducto(producto.id);
        },
        child: Card(
          child: Column(
            children: <Widget>[
              (producto.fotoUrl == null)
                  ? Image(image: AssetImage('assets/no-image.png'))
                  : FadeInImage(
                      image: NetworkImage(producto.fotoUrl),
                      placeholder: AssetImage('assets/jar-loading.gif'),
                      height: 300.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
              ListTile(
                title: Text('${producto.titulo} -${producto.valor}'),
                subtitle: Text(producto.id),
                /* onTap: ()=>Navigator.pushNamed(context, 'producto'), */
                onTap: () => Navigator.pushNamed(context, 'producto',
                    arguments: producto),
              )
            ],
          ),
        ));
  }
}
/* 
*/
