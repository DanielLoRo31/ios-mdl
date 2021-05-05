import 'dart:math';

import 'package:examen_flutter_2p/config/palette.dart';
import 'package:examen_flutter_2p/widgets/custom_button.dart';
import 'package:examen_flutter_2p/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class RandomPage extends StatefulWidget {
  @override
  _RandomPageState createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  int startValue = 0;
  int finalValue = 0;
  int result = 0;

  setStartValue(value) {
    setState(() {
      startValue = int.parse(value);
    });
  }

  setFinalValue(value) {
    setState(() {
      finalValue = int.parse(value);
    });
  }

  setResult() {
    final randomVal = Random();

    setState(() {
      result = startValue +
          randomVal.nextInt(finalValue.toInt() - startValue.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 35, right: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  splashColor: Colors.transparent,
                  color: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 20,
                    color: Palette.yellowWarning,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'Sea una secuencias ri= (ri,r2,r3…..rn) con n valores distintos, se le conoce como el conjunto de números entre 0 y 1 para ralizar una simulación de procesos estocásticos (basado en probabilidades) y son usados para generar la conducta de variables  aleatorias continuas o discretas. Estos números se consideran pseudoaleatorios porque es imposible el generar números realmente aleatorios.',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              labelText: 'start',
              obscureText: false,
              prefixIconData: Icons.mail_outline,
              onChange: setStartValue,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              labelText: 'final',
              obscureText: false,
              prefixIconData: Icons.mail_outline,
              onChange: setFinalValue,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'result => ' + result.toString(),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 35,
            ),
            CustomButton(
              title: 'Generate',
              onPressed: () {
                setResult();
              },
              buttonType: 1,
            ),
          ],
        ),
      ),
    );
  }
}
