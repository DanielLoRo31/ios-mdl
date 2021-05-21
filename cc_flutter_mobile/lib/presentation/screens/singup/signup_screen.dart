import 'package:flutter/material.dart';
// Config
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:cc_flutter_mobile/config/design_paddings.dart';
// My packages
import 'package:cc_flutter_mobile/presentation/widgets/singin_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  PageController _pageController = new PageController(initialPage: 0);

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
              content: 'Fill the fields, register\nand be welcome to CashCoin',
              title: 'Sign Up Form :)', styleType: 'Smile', width: 50, fSize1: 18, height: 50, fSize2: 16,
            ),
            SizedBox(
              height: 2 * space,
            ),
            Container(
              height: 325,
              child: Row(
                children: [
                  Expanded(
                    child: Theme(
                      data: ThemeData(
                        accentColor: Palette.darkGreen,
                      ),
                      child: PageView(
                        controller: _pageController,
                        children: <Widget>[
                          SignUpAFormCard(),
                          SignUpPFormCard(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2 * space,
            ),
            CustomButton(
              onPressed: null,
              buttonType: 4,
              title: 'Click me!!',
            ),
            SizedBox(
              height: 5 * space,
            ),
            GoToCard(
              mainText: "Account already created mister? you should ",
              toGoText: 'Log in',
              onTap: null,
            ),
          ],
        ),
      ),
    );
  }
}
