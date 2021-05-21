import 'package:flutter/material.dart';
// My packages
import 'package:cc_flutter_mobile/config/palette.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final IconData prefixIconData;
  final bool isPassword;

  CustomTextField({
    this.labelText,
    this.prefixIconData,
    @required this.isPassword,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;
  String _labelText;
  IconData _prefixIconData;
  bool _isPassword;

  IconData _iconChange() {
    if (_obscureText) return Icons.visibility;
    if (!_obscureText) return Icons.visibility_off;
    return Icons.visibility_off;
  }

  void _showMeDaPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _labelText = widget.labelText;
      _prefixIconData = widget.prefixIconData;
      _isPassword = widget.isPassword;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.transparent,
      elevation: 8,
      child: TextField(
        obscureText: this._isPassword ? true : false,
        style: TextStyle(color: Colors.white70, fontSize: 14.0),
        decoration: InputDecoration(
          filled: true,
          fillColor: Palette.lightBlack,
          labelText: this._labelText,
          prefixIcon: Icon(
            this._prefixIconData,
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
          suffixIcon: this._isPassword ? IconButton(
            onPressed: _showMeDaPassword,
            icon: Icon(
              _iconChange(),
              size: 18,
              color: Colors.white70,
            ),
          ) : null,
          labelStyle: TextStyle(fontSize: 13.0, color: Colors.white70),
          focusColor: Colors.white70,
        ),
      ),
    );
  }
}
