import 'package:examen_flutter_2p/config/palette.dart';
import 'package:examen_flutter_2p/widgets/custom_button.dart';
import 'package:examen_flutter_2p/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Map<String, String> formData = {
    "name": "",
    "age": "",
    "state": "",
  };
  setName(value) {
    setState(() {
      formData["name"] = value;
    });
  }

  setAge(value) {
    setState(() {
      formData["age"] = value;
    });
  }

  setStateData(value) {
    setState(() {
      formData["state"] = value;
    });
  }

  // Dialog
  Row _buildTopBlock(ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        IconButton(
          splashColor: Colors.transparent,
          color: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            Icons.clear,
            size: 20,
            color: Palette.redWarning,
          ),
          onPressed: () {
            Navigator.pop(ctx);
          },
        ),
      ],
    );
  }

  _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: _buildTopBlock(context),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text('Welcome! ' +
                      formData["name"] +
                      ' you have ' +
                      formData["age"] +
                      ' years, you are from ' +
                      formData["state"]),
                ),
              ],
            ),
            actions: <Widget>[
              RawMaterialButton(
                elevation: 4,
                fillColor: Palette.greenConfirm,
                splashColor: Palette.darkGreen,
                onPressed: () {
                  // Navigator.of(context).pop();
                  Navigator.of(context).popAndPushNamed('menu');
                },
                child: Center(
                  widthFactor: 6,
                  heightFactor: 3,
                  child: Text(
                    "Ok",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ],
          );
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
            CustomTextField(
              labelText: 'name',
              obscureText: false,
              prefixIconData: Icons.mail_outline,
              onChange: setName,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              labelText: 'age',
              obscureText: false,
              prefixIconData: Icons.mail_outline,
              onChange: setAge,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              labelText: 'State',
              obscureText: false,
              prefixIconData: Icons.lock_outline,
              onChange: setStateData,
            ),
            SizedBox(
              height: 35,
            ),
            CustomButton(
              title: 'Login',
              onPressed: () {
                _mostrarAlert(context);
              },
              buttonType: 3,
            ),
          ],
        ),
      ),
    );
  }
}
