import 'package:examen_flutter_2p/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 45, right: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              title: 'Operation',
              onPressed: () {
                Navigator.pushNamed(context, 'operation');
              },
              buttonType: 0,
            ),
            SizedBox(
              height: 35,
            ),
            CustomButton(
              title: 'Order Name',
              onPressed: () {
                Navigator.pushNamed(context, 'order_name');
              },
              buttonType: 1,
            ),
            SizedBox(
              height: 35,
            ),
            CustomButton(
              title: 'Random',
              onPressed: () {
                Navigator.pushNamed(context, 'random');
              },
              buttonType: 2,
            ),
          ],
        ),
      ),
    );
  }
}
