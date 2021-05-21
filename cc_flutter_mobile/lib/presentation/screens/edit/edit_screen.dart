import 'package:flutter/material.dart';
// Config
import 'package:cc_flutter_mobile/config/design_paddings.dart';
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
// Packages
import 'package:cc_flutter_mobile/presentation/widgets/edit_widgets.dart';

class EditScreen extends StatefulWidget {
@override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
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
              content: 'You can change it anytime\nyou want',
              title: 'Modify your information',
              styleType: 'Surprise',
              width: 50,
              fSize1: 18,
              height: 50,
              fSize2: 16,
            ),
            SizedBox(
              height: space,
            ),
            EditFormCard(),
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
