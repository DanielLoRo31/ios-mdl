import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:flutter/material.dart';

import '../../textfields/custom_text_field.dart';

class SignUpAFormCard extends StatefulWidget {
  const SignUpAFormCard({Key key}) : super(key: key);

  @override
  _SignUpAFormCardState createState() => _SignUpAFormCardState();
}

class _SignUpAFormCardState extends State<SignUpAFormCard> {

  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? DesignSpacings.spaceM : DesignSpacings.spaceS;

    return Card(
      color: Palette.lightBlack,
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            Text('Fill the information for your account', style: TextStyle(color: Colors.white54, fontSize: 16.0),),
            SizedBox(
              height: 2 * space,
            ),
            CustomTextField(
              labelText: 'Email',
              prefixIconData: Icons.mail_outline,
              isPassword: false,
            ),
            SizedBox(
              height: space,
            ),
            CustomTextField(
              labelText: 'Password',
              prefixIconData: Icons.lock_outline,
              isPassword: true,
            ),
            SizedBox(
              height: space,
            ),
            CustomTextField(
              labelText: 'Phone',
              prefixIconData: Icons.mail_outline,
              isPassword: false,
            ),
            SizedBox(
              height: 1.3 * space,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('swipe right to fill your personal information', style: TextStyle(color: Colors.white30, fontSize: 12.0),),
                SizedBox(width: space,),
                Icon(
                  Icons.swipe,
                  color: Palette.darkGreen,
                  size: 16.0,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}