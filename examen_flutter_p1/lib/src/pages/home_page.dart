import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  @override
  createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final _num = 20;
  int _yAxisPos;
  int _xAxisPos;
  var _data;

  HomePageState() {
    _data = new List<Widget>();
    _yAxisPos = ((_num - 1) / 2).round();
    _xAxisPos = ((_num - 1) / 2).round();

    for (var i = 0; i < _num; i++) {
      for (var j = 0; j < _num; j++) {
        if (i == _yAxisPos && j == _xAxisPos) {
          _data.add(Container(
            color: Colors.green,
          ));
        } else {
          _data.add(Container(
            color: Colors.black,
          ));
        }
      }
    }
  }

  void reloadValues() => {
        setState(() {
          _yAxisPos = ((_num - 1) / 2).round();
          _xAxisPos = ((_num - 1) / 2).round();

          Fluttertoast.showToast(
              msg: "Te pasaste",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        })
      };

  void setPosition() => {
        setState(() {
          _data = <Widget>[];
          for (var i = 0; i < _num; i++) {
            for (var j = 0; j < _num; j++) {
              if (i == _yAxisPos && j == _xAxisPos) {
                _data.add(Container(
                  color: Colors.green,
                ));
              } else {
                _data.add(Container(
                  color: Colors.black,
                ));
              }
            }
          }
        })
      };

  void setUpInstruction() => {
        setState(() {
          _yAxisPos--;
          if (_yAxisPos < 0) {
            reloadValues();
          }
          setPosition();
        })
      };

  void setRInstruction() => {
        setState(() {
          _xAxisPos++;
          if (_xAxisPos > (_num - 1)) {
            reloadValues();
          }
          setPosition();
        })
      };

  void setLInstruction() => {
        setState(() {
          _xAxisPos--;
          if (_xAxisPos < 0) {
            reloadValues();
          }
          setPosition();
        })
      };

  void setDownInstruction() => {
        setState(() {
          _yAxisPos++;
          if (_yAxisPos > (_num - 1)) {
           reloadValues();
          }
          setPosition();
        })
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MDL examen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.count(crossAxisCount: _num, children: _data),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                  ),
                  FlatButton(
                      onPressed: setUpInstruction,
                      child: Icon(Icons.arrow_upward_outlined)),
                  Container(
                    padding: const EdgeInsets.all(8),
                  ),
                  FlatButton(
                      onPressed: setLInstruction,
                      child: Icon(Icons.arrow_back_outlined)),
                  Container(
                    padding: const EdgeInsets.all(8),
                  ),
                  FlatButton(
                      onPressed: setRInstruction,
                      child: Icon(Icons.arrow_forward_outlined)),
                  Container(
                    padding: const EdgeInsets.all(8),
                  ),
                  FlatButton(
                      onPressed: setDownInstruction,
                      child: Icon(Icons.arrow_downward_outlined)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
