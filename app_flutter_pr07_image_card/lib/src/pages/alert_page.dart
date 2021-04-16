import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert Page'), actions: <Widget>[
        Container(
            padding: EdgeInsets.all(5.0),
            child: GestureDetector(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.lego.com/cdn/cs/set/assets/blt167d8e20620e4817/DC_-_Character_-_Details_-_Sidekick-Standard_-_Batman.jpg?fit=crop&format=jpg&quality=80&width=800&height=426&dpr=1'),
                child: Text('DL',
                    style: TextStyle(
                        color: Colors.yellow, fontWeight: FontWeight.bold)),
              ),
              onTap: () {
                _mostrarAlert(context);
              },
            ))
      ]),
      // body: Center(
      //     child: ElevatedButton(
      //   child: Text('Alerta'),
      //   onPressed: () => _mostrarAlert(context),
      //   style: ElevatedButton.styleFrom(
      //       primary: Colors.orange, shape: StadiumBorder()),
      // )),
    );
  }

  Row _buildTopBlock(ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        IconButton(
          splashColor: Colors.transparent,
          color: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            Icons.clear,
            size: 20,
            color: Colors.amber,
          ),
          onPressed: () {
            Navigator.pop(ctx);
          },
        ),
      ],
    );
  }

  _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: _buildTopBlock(context),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FadeInImage(
                  image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Antu_dialog-warning.svg/1200px-Antu_dialog-warning.svg.png'),
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  fadeInDuration: Duration(milliseconds: 500),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                      'Cuidado, esta demasiado guapo para abrir esta alerta'),
                ),
              ],
            ),
            actions: <Widget>[
              // FlatButton(
              //   child: Text('Ok'),
              //   onPressed: () => Navigator.of(context).pop(),
              // ),
              RawMaterialButton(
                elevation: 4,
                fillColor: Colors.red,
                splashColor: Colors.yellow,
                onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).popAndPushNamed('card');
                  // Navigator.pushNamed(context, 'card');
                },
                child: Center(
                  widthFactor: 6,
                  heightFactor: 3,
                  child: Text(
                    "Ok",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ],
          );
        });
  }
}
