import 'dart:math';

import 'package:examen_flutter_2p/config/palette.dart';
import 'package:examen_flutter_2p/widgets/custom_button.dart';
import 'package:examen_flutter_2p/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class OperationPage extends StatefulWidget {
  @override
  _OperationPageState createState() => _OperationPageState();
}

class _OperationPageState extends State<OperationPage> {
  Map<String, double> formData = {
    "a": 0,
    "b": 0,
    "c": 0,
    "result_p": 0,
    "result_n": 0
  };

  setA(value) {
    setState(() {
      formData["a"] = double.parse(value);
    });
  }

  setB(value) {
    setState(() {
      formData["b"] = double.parse(value);
    });
  }

  setC(value) {
    setState(() {
      formData["c"] = double.parse(value);
    });
  }

  setResultPositive() {
    double pTemp = (-(formData["b"] +
            sqrt(
                (pow(formData["b"], 2) - 4 * formData["a"] * formData["c"])))) /
        (2 * formData["a"]);

    setState(() {
      formData["result_p"] = pTemp;
    });
  }

  setResultNegative() {
    double nTemp = (-(formData["b"] -
            sqrt(
                (pow(formData["b"], 2) - 4 * formData["a"] * formData["c"])))) /
        (2 * formData["a"]);

    setState(() {
      formData["result_n"] = nTemp;
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
          children: <Widget>[
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
              height: 40,
            ),
            Text(
              'La fórmula cuadrática puede usarse para resolver cualquier ecuación de la forma ax2 + bx + c = 0. La forma ax2 + bx + c = 0 se llama la forma estándar de una ecuación cuadrática. Antes de resolver una ecuación cuadrática usando la fórmula cuadrática, es vital estar seguros de que la ecuación tenga esta forma.',
              style: TextStyle(color: Colors.white,),
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              labelText: 'a',
              obscureText: false,
              prefixIconData: Icons.mail_outline,
              onChange: setA,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              labelText: 'b',
              obscureText: false,
              prefixIconData: Icons.mail_outline,
              onChange: setB,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              labelText: 'c',
              obscureText: false,
              prefixIconData: Icons.lock_outline,
              onChange: setC,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Result\nx1 => ' +
                  formData["result_p"].toString() +
                  '\nx2 => ' +
                  formData["result_n"].toString(),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 35,
            ),
            CustomButton(
              title: 'calculate',
              onPressed: () {
                setResultNegative();
                setResultPositive();
              },
              buttonType: 1,
            ),
          ],
        ),
      ),
    );
  }
}
