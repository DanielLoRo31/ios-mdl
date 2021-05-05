
import 'package:componentes/src/utils/color_converter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final colorConverter = ColorConverter();

  final Color color;
  final String userName;
  final double quantity;
  final String cardHolder;
  final String lastDate;
  final String email;
  final Function onPressed;

  StatusCard({this.color, this.userName, this.quantity, this.cardHolder, this.lastDate, this.email, this.onPressed}) ;



  Row _buildTopBlock() {
    return Row(
      /*1*/
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          splashColor: Colors.transparent,
          color: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            Icons.settings,
            size: 20,
            color: Colors.white38,
          ),
          onPressed: onPressed,
        ),
      ],
    );
  }

  Container _buildBodyBlock() {
    return Container(
      padding: const EdgeInsets.only(left: 25.0, right: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'User Name' + this.userName,
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,),
          ),
          SizedBox(height: 15,),
          Text(
            'Quantity \$$quantity',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,),
          ),
        ],
      ),
    );
  }

  Column _buildBottomChild({@required String label, @required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$label',
          style: TextStyle(
              color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          '$value',
          style: TextStyle(
              color: Colors.white70, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Row _builBottomBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        /* Here we are going to place the _buildDetailsBlock */
        _buildBottomChild(
          label: 'email',
          value: this.email,
        ),
        _buildBottomChild(
          label: 'Last login',
          value: this.lastDate,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      color: colorConverter.hexToColor("8c9641"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 280,
        padding: const EdgeInsets.only(right: 16.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildTopBlock(),
            _buildBodyBlock(),
            SizedBox(height: 35,),
            _builBottomBlock(),
          ],
        ),
      ),
    );
  }
}