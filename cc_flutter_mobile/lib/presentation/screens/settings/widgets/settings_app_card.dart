import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:flutter/material.dart';

class SettingsAppCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Palette.lightBlack,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: <Widget>[
            SwitchListTile(
                activeColor: Palette.lightGreen,
                value: true,
                title: Text(
                  'Dark theme',
                  style: TextStyle(color: Colors.white70),
                ),
                onChanged: null),
            SwitchListTile(
                activeColor: Palette.lightGreen,
                inactiveThumbColor: Palette.lightBlack,
                value: false,
                title: Text(
                  'Received Notifications',
                  style: TextStyle(color: Colors.white70),
                ),
                onChanged: null),
          ],
        ),
      ),
    );
  }
}
