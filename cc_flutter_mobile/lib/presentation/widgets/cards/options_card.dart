import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//  My packages
import 'package:cc_flutter_mobile/config/palette.dart';

class OptionsCard extends StatelessWidget {
  final Function onTap;

  OptionsCard({@required this.onTap});

  RichText _buildBottomRichText() {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.white60, fontSize: 14.0,),
        children: <TextSpan>[
          TextSpan(text: 'Already Have an account?'),
          TextSpan(
              text: ' Log In',
              style: TextStyle(color: Colors.blue,),
              recognizer: TapGestureRecognizer()
                ..onTap = this.onTap),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Card(
      color: Palette.lightBlack,
      margin: EdgeInsets.only(bottom: 25),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Center(child: _buildBottomRichText()),
      ),
    );
  }
}
