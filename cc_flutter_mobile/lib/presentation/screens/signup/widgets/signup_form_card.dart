import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:cc_flutter_mobile/presentation/screens/signup/widgets/signup_form.dart';
import 'package:flutter/material.dart';

class SgnUpFormCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Palette.lightBlack,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: SignUpForm(),
      ),
    );
  }
}
