import 'package:cc_flutter_mobile/presentation/screens/settings/widgets/settings_app_card.dart';
import 'package:cc_flutter_mobile/presentation/screens/settings/widgets/settings_password_card.dart';
import 'package:cc_flutter_mobile/presentation/screens/settings/widgets/settings_security_card.dart';
import 'package:cc_flutter_mobile/presentation/widgets/buttons/custom_button.dart';
import 'package:cc_flutter_mobile/presentation/widgets/cards/title_card.dart';
import 'package:cc_flutter_mobile/presentation/widgets/cards/options_card.dart';
import 'package:flutter/material.dart';
// Config
import 'package:cc_flutter_mobile/config/design_paddings.dart';
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
// My packages

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
              content: 'Check your settings and\nmodify anything you need ;)',
              title: 'Settings :o',
              styleType: 'Surprise',
              width: 50,
              fSize1: 18,
              height: 50,
              fSize2: 16,
            ),
            SizedBox(
              height: space,
            ),
            SettingsPasswordCard(
                name: 'USER_NAME', onTap: () => print('taped')),
            SizedBox(
              height: space,
            ),
            SettingsSecurityCard(),
            SizedBox(
              height: space,
            ),
            SettingsAppCard(),
            SizedBox(
              height: 2 * space,
            ),
            CustomButton(title: 'Log out', onPressed: null, buttonType: 2),
            SizedBox(
              height: 0.5 * space,
            ),
            CustomButton(
                title: 'Close account', onPressed: null, buttonType: 1),
            SizedBox(
              height: 3 * space,
            ),
            OptionsCard(
              onTap: null,
            ),
          ],
        ),
      ),
    );
  }
}
