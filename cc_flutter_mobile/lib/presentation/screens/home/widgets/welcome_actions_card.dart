import 'package:flutter/material.dart';
//  My packages
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/logos_path.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:cc_flutter_mobile/presentation/widgets/buttons/custom_button.dart';

class WelcomeActionsCard extends StatelessWidget {
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
          children: [
            CustomButton(title: 'Go to Login', onPressed: () => Navigator.pushNamed(context, 'login'), buttonType: 4),
            SizedBox(
              height: space,
            ),
            CustomButton(
              title: 'Sing up with Google',
              onPressed: null,
              buttonType: 3,
              image: Image(
                image: AssetImage(LogoPath.googleLogoPath),
                width: 15,
                height: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
