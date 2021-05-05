import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child:
                CircleAvatar(child: Text('DL'), backgroundColor: Colors.pink),
          ),
          Container(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.lego.com/cdn/cs/set/assets/blt167d8e20620e4817/DC_-_Character_-_Details_-_Sidekick-Standard_-_Batman.jpg?fit=crop&format=jpg&quality=80&width=800&height=426&dpr=1'),
                  radius: 25)),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://cdn.pixabay.com/photo/2015/03/11/01/33/hulk-667988_1280.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 500),
        ),
      ),
    );
  }
}
