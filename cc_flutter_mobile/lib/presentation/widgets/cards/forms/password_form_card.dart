import 'package:flutter/material.dart';
// My packages
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:cc_flutter_mobile/presentation/widgets/textfields/custom_text_field.dart';

class PasswordFormCard extends StatefulWidget {
  @override
  _PasswordFormCardState createState() => _PasswordFormCardState();
}

class _PasswordFormCardState extends State<PasswordFormCard> {
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
            Text('Complete the process to change the password', style: TextStyle(color: Colors.white54, fontSize: 16.0),),
            SizedBox(
              height: space,
            ),
            CustomTextField(
              labelText: 'Current Password',
              prefixIconData: Icons.lock_outline,
              isPassword: true,
            ),
            SizedBox(
              height: space,
            ),
            CustomTextField(
              labelText: 'New Password',
              prefixIconData: Icons.lock_outline,
              isPassword: true,
            ),
            SizedBox(
              height: space,
            ),
            CustomTextField(
              labelText: 'Confirm Password',
              prefixIconData: Icons.lock_outline,
              isPassword: true,
            ),
          ],
        ),
      ),
    );
  }
}