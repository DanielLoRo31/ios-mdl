import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/logos_path.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? DesignSpacings.spaceM : DesignSpacings.spaceS;

    return Card(
      color: Palette.darkGreen,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Image(
              image: AssetImage(LogoPath.rSmileLogoPath),
              width: 50,
              height: 50,
            ),
            SizedBox(
              height: space,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Column(children: <Widget>[
                Text(
                  'Hello, Human!',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: space,),
                Text(
                  'Im here to guide you.\nWhat would you like to do?',
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 15,
                  ),
                ),
              ],),
            ),
          ],
        ),
      ),
    );
  }
}
