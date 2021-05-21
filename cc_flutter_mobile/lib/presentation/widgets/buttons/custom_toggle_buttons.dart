import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:flutter/material.dart';

class CustomToggleButtons extends StatefulWidget {
  const CustomToggleButtons({Key key}) : super(key: key);

  @override
  _CustomToggleButtonsState createState() => _CustomToggleButtonsState();
}

class _CustomToggleButtonsState extends State<CustomToggleButtons> {
  List<bool> _isSelected = [true, false, false];

  void _setOption(int index) {
    setState(() {
      for (int i = 0; i < _isSelected.length; i++) {
        if (i != index) {
          _isSelected[i] = false;
        }
        if (i == index) {
          _isSelected[i] = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ToggleButtons(
        onPressed: _setOption,
        isSelected: _isSelected,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Center(
                  child: Text(
                'All',
                style: TextStyle(color: Colors.white60),
              ))),
          Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Center(
                  child: Text(
                'Transfers',
                style: TextStyle(color: Colors.white60),
              ))),
          Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Center(
                  child: Text(
                'Deposits',
                style: TextStyle(color: Colors.white60),
              ))),
        ],
        borderRadius: BorderRadius.circular(10),
        selectedBorderColor: Palette.lightBlack,
        selectedColor: Palette.lightBlack,
        fillColor: Palette.darkGreen,
        // renderBorder: false,
      ),
    );
  }
}
