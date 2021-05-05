import 'package:examen_flutter_2p/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onChange;
  final Function onPressed;

  CustomTextField(
      {this.labelText,
      this.prefixIconData,
      this.suffixIconData,
      this.obscureText,
      this.onChange,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 8,
      child: TextField(
        obscureText: obscureText,
        style: TextStyle(color: Colors.white70, fontSize: 14.0),
        decoration: InputDecoration(
          filled: true,
          fillColor: Palette.blackBg,
          labelText: this.labelText,
          prefixIcon: Icon(
            this.prefixIconData,
            size: 18,
            color: Colors.white70,
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white70)),
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(
              suffixIconData,
              size: 18,
              color: Colors.white70,
            ),
          ),
          labelStyle: TextStyle(fontSize: 13.0, color: Colors.white70),
          focusColor: Colors.white70,
        ),
        onChanged: onChange,
      ),
    );
  }
}
