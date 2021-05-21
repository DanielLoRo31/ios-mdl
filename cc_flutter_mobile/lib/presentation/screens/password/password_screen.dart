import 'package:flutter/material.dart';
// Config
import 'package:cc_flutter_mobile/config/design_paddings.dart';
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
// My packages
import 'package:cc_flutter_mobile/presentation/widgets/password_widgets.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key key}) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
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
              content: 'Modify your password\ntry to not lose it',
              title: 'Change your password...',
              styleType: 'Surprise',
              width: 50,
              fSize1: 18,
              height: 50,
              fSize2: 16,
            ),
            SizedBox(
              height: space,
            ),
            PasswordFormCard(),
            SizedBox(
              height: 2 * space,
            ),
            CustomButton(title: 'Make the change', onPressed: (){}, buttonType: 4),
            SizedBox(
              height: 6 *space,
            ),
            GoToCard(
              mainText: "Wrong section? ",
              toGoText: 'Go back to Status screen',
              onTap: null,
            ),
          ],
        ),
      ),
    );
  }
}
