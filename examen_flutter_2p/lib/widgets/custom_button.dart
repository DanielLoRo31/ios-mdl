import 'package:examen_flutter_2p/config/palette.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onPressed; // GestureTapCallback
  final int
      buttonType; // 0 normal, 1 middle warning, 2 warning, 3 transparent, default normal
  // final colorConverter = ColorConverter();

  CustomButton(
      {this.title, @required this.onPressed, @required this.buttonType});

  _buttonTypeValidationAction() {
    if (buttonType == 0) return Palette.lightGreen; // green accent
    if (buttonType == 1) return Palette.redWarning; // red warning
    if (buttonType == 2) return Palette.yellowWarning;
    if (buttonType == 3) return Palette.blueCool; // yellow careful
    return Palette.lightGreen;
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 4,
      fillColor: _buttonTypeValidationAction(),
      splashColor: Palette.lightBlack,
      onPressed: onPressed,
      child: Center(
        widthFactor: 6,
        heightFactor: 3,
        child: Text(
          this.title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
