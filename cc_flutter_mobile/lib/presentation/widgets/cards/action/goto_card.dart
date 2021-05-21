import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GoToCard extends StatelessWidget {
  final TextStyle defaultStyle =
      TextStyle(color: Colors.white60, fontSize: 10.0);
  final TextStyle linkStyle = TextStyle(color: Colors.blue);
  final String mainText;
  final String toGoText;
  final VoidCallback onTap;

  GoToCard({this.mainText, this.toGoText, this.onTap});

  RichText _buildBottomRichText() {
    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: <TextSpan>[
          TextSpan(text: mainText),
          TextSpan(
              text: toGoText,
              style: linkStyle,
              recognizer: TapGestureRecognizer()..onTap = null),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 25),
      color: Palette.lightBlack,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(child: _buildBottomRichText()),
      ),
    );
  }
}
