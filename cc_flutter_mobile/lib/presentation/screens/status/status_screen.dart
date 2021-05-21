import 'package:flutter/material.dart';
// Config
import 'package:cc_flutter_mobile/config/design_paddings.dart';
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
// My packages
import 'package:cc_flutter_mobile/presentation/widgets/status_widgets.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  final List<Map<String, dynamic>> _possibleActions = [
    {
      'title': 'Movements',
      'content': 'Check your recent movements',
      'action': 'movements',
      'icon': Icons.trending_up_outlined
    },
    {
      'title': 'Deposit',
      'content': 'Add money to your account',
      'action': 'deposit',
      'icon': Icons.wallet_giftcard
    },
    {
      'title': 'Transfer',
      'content': 'Send money to a friend, or to me :)',
      'action': 'transfer',
      'icon': Icons.add_box_rounded
    },
    {
      'title': 'Settings',
      'content': 'Modify app and account parameters',
      'action': 'transfer',
      'icon': Icons.settings
    },
  ];

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
              content: 'HERE_PERSON_NAME_TOKEN',
              title: 'Welcome Back <3\nI missed you',
              width: 55,
              height: 55,
              styleType: 'Love',
              fSize1: 18,
              fSize2: 14,
            ),
            SizedBox(
              height: space,
            ),
            StatusCard(),
            SizedBox(
              height: 2 * space,
            ),
            Container(
              height: 160,
              child: Theme(
                data:ThemeData(
                    accentColor: Palette.darkGreen
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: _possibleActions.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 160,
                      child: ActionCard(
                        title: _possibleActions[index]['title'],
                        content: _possibleActions[index]['content'],
                        actionType: _possibleActions[index]['action'],
                        icon: _possibleActions[index]['icon'],),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 2 * space,
            ),
            Container(height: 100, child: CCMeterCard(opinion: 'empty',)),
            SizedBox(
              height: 2 * space,
            ),
            AdviceCard(
              title: 'Having troubles saving money?',
              content: 'Visit our blog and learn!',
              size: 35,
              fSize1: 16,
              fSize2: 14,
            )
          ],
        ),
      ),
    );
  }
}
