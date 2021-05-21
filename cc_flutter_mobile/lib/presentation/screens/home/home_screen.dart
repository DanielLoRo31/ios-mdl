import 'package:flutter/material.dart';
// Config
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:cc_flutter_mobile/config/design_paddings.dart';
import 'package:cc_flutter_mobile/config/design_spacings.dart';
// My packages
import 'package:cc_flutter_mobile/presentation/widgets/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? DesignSpacings.spaceM : DesignSpacings.spaceS;

    return Scaffold(
      backgroundColor: Palette.blackBg,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: DesignPaddings.paddingL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            HeaderSection(),
            SizedBox(
              height: 5 * space,
            ),
            WelcomeCard(),
            SizedBox(height: 2 * space,),
            WelcomeActionsCard(),
            SizedBox(
              height: 5 * space,
            ),
            GoToCard(mainText: "Oh! you don't have an account? then ", toGoText: 'Sing in', onTap: null,),
          ],
        ),
      ),
    );
  }
}
