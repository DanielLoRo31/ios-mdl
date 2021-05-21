import 'package:flutter/material.dart';
// Config
import 'package:cc_flutter_mobile/config/design_paddings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:cc_flutter_mobile/config/design_spacings.dart';
// My Packages
import 'package:cc_flutter_mobile/presentation/widgets/login_widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? DesignSpacings.spaceM : DesignSpacings.spaceS;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.blackBg,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: DesignPaddings.paddingL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TitleCard(
              content: 'Fill the fields, authenticate\nand enjoy CashCoin',
              title: 'Login Form *.*',
              width: 55,
              height: 55,
              styleType: 'Happy',
              fSize1: 18,
              fSize2: 14,
            ),
            SizedBox(
              height: 2 * space,
            ),
            LoginFormCard(),
            SizedBox(
              height: 2 * space,
            ),
            CustomButton(title: 'Accept', onPressed: null, buttonType: 4),
            SizedBox(
              height: 7 * space,
            ),
            GoToCard(
              mainText: "Do not have an account? please ",
              toGoText: 'Sign in',
              onTap: null,
            ),
          ],
        ),
      ),
    );
  }
}
