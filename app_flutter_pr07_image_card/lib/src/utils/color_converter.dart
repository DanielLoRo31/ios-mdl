import 'dart:ui';

class ColorConverter {
  ColorConverter();

  Color hexToColor(String code) {
    return Color(int.parse('0xff' + code));
  }
}
