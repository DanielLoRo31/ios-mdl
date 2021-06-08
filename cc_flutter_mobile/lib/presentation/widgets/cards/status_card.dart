import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:flutter/material.dart';


class StatusCard extends StatefulWidget {
  @override
  _StatusCardState createState() => _StatusCardState();
}


class _StatusCardState extends State<StatusCard> {
  double _quantity = 0.0;
  String _email = 'No email from state';

  @override
  Widget build(BuildContext context) {
    var _height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = _height > 650 ? DesignSpacings.spaceM : DesignSpacings.spaceS;


    return Card(
      elevation: 4,
      color: Palette.darkGreen,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Account resume',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                  ),
                )
              ],
            ),
            SizedBox(
              height: space,
            ),
            Row(
              children: <Widget>[
                Text(
                  r'$ ' + this._quantity.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2* space,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: space,
                ),
                Text(
                  this._email,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}