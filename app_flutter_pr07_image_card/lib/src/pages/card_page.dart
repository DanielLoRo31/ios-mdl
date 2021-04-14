
import 'package:flutter/material.dart';
import '../widgets/card.dart';

class CardPage extends StatelessWidget {
  List<String> img = <String>['https://cdn.pixabay.com/photo/2015/07/09/22/50/bear-838688_1280.jpg', 'https://cdn.pixabay.com/photo/2017/10/18/07/54/ceiling-2863154_1280.jpg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        children: _renderCards(context),
      ),
    );
  }

  List<Widget> _renderCards(context){
    return img.map((image) => 
      _cardCompleta(context, image)
    ).toList();
  }

  Widget _cardCompleta(context, img) {
    return Container(
        child: Column(
      children: <Widget>[
        _cardt1(),
        SizedBox(
          height: 30,
        ),
        _cardt2(context, img),
        SizedBox(
          height: 30,
        ),
        StatusCard(cardHolder: 'hola', color: Colors.black, userName: 'Mario', quantity: 500.00, lastDate: '20/03/17', email: 'primoroso@mail.com'),
        SizedBox(
          height: 50,
        ),
      ],
    ));
  }

  Widget _cardt1() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.assistant_photo, color: Colors.cyanAccent),
            title: Text('Daniel Eduardo Lozano Rodríguez'),
            subtitle: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'),
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text('Aceptar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardt2(context, img) {
    final card = Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(img),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 500),
            height: 200.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Descripción de la imagen en el contenedor'),
          )
        ],
      ),
    );

    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(2.0, 10.0))
          ],
          color: Colors.white),
    );
  }


}
