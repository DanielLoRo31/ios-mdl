import 'package:flutter/material.dart';
// My packages
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:cc_flutter_mobile/presentation/widgets/textfields/custom_text_field.dart';

class LoginFormCard extends StatefulWidget {
@override
  _LoginFormCardState createState() => _LoginFormCardState();
}

class _LoginFormCardState extends State<LoginFormCard> {
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
          children: [
            Text('Fill the information to authenticate', style: TextStyle(color: Colors.white54, fontSize: 16.0),),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTextField(
                  labelText: 'Password',
                  prefixIconData: Icons.lock_outline,
                  isPassword: true,
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: null,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
