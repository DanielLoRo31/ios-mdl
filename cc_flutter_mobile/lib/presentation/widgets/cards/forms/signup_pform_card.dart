import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:flutter/material.dart';

import '../../textfields/custom_text_field.dart';

class SignUpPFormCard extends StatefulWidget {
  const SignUpPFormCard({Key key}) : super(key: key);

  @override
  _SignUpPFormCardState createState() => _SignUpPFormCardState();
}

class _SignUpPFormCardState extends State<SignUpPFormCard> {
  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? DesignSpacings.spaceM : DesignSpacings.spaceS;

    return Card(
      color: Palette.lightBlack,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Whats your name? :)',
              style: TextStyle(color: Colors.white54, fontSize: 16.0),
            ),
            SizedBox(
              height: 2 * space,
            ),
            CustomTextField(
              prefixIconData: Icons.face,
              labelText: 'Name',
              isPassword: false,
            ),
            SizedBox(
              height: space,
            ),
            CustomTextField(
              prefixIconData: Icons.face,
              labelText: 'Last name',
              isPassword: false,
            ),
            SizedBox(
              height: 3.2 * space,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Click the button to complete',
                  style: TextStyle(color: Colors.white30, fontSize: 12.0),
                ),
                SizedBox(
                  width: 2 * space,
                ),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  color: Palette.darkGreen,
                  size: 35.0,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
