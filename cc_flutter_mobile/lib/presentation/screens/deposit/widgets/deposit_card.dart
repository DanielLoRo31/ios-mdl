import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:flutter/material.dart';

class DepositCard extends StatefulWidget {
  @override
  _DepositCardState createState() => _DepositCardState();
}

class _DepositCardState extends State<DepositCard> {
  String _code = 'HERE_LIES_YOUR_CODE';
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
                  'Tap me to copy the code!',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
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
                  'Name',
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
            SizedBox(
              height: space,
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
            SizedBox(
              height: space,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Code',
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
                  this._code,
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
