import 'package:examen_flutter_2p/config/palette.dart';
import 'package:examen_flutter_2p/widgets/custom_button.dart';
import 'package:examen_flutter_2p/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class OrderNamePage extends StatefulWidget {
  @override
  _OrderNamePageState createState() => _OrderNamePageState();
}

class _OrderNamePageState extends State<OrderNamePage> {
  String currName = "";
  String resultString = "";

  setName(value) {
    setState(() {
      currName = value;
    });
  }

  setResultString() {
    List<String> charList = [];

    for (var i = 0; i < currName.length; i++) {
      charList.add(currName[i]);
    }

    charList.sort();

    setState(() {
      resultString = "";
      for (var i = 0; i < currName.length; i++) {
        resultString += charList[i];
      }
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
              height: 60,
            ),
            CustomTextField(
              labelText: 'name',
              obscureText: false,
              prefixIconData: Icons.mail_outline,
              onChange: setName,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'result => $resultString',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 35,
            ),
            CustomButton(
              title: 'Calculate',
              onPressed: () {
                setResultString();
              },
              buttonType: 1,
            ),
          ],
        ),
      ),
    );
  }
}
