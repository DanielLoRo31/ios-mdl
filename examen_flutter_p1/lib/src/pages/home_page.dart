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
  final tlimit = 10;
  final blimit = -10;

  int _yAxisPos = 1;
  int _xAxisPos = 1;
  var _positionGrid;

  HomePageState() {
    _positionGrid = new List(3);
    _positionGrid[0] = new List<Color>(3);
    _positionGrid[1] = new List<Color>(3);
    _positionGrid[2] = new List<Color>(3);

    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        if (i == _yAxisPos && j == _xAxisPos) {
          _positionGrid[i][j] = Colors.green;
        } else {
          _positionGrid[i][j] = Colors.black;
        }
      }
    }
  }

  void setPosition() => {
        setState(() {
          for (var i = 0; i < 3; i++) {
            for (var j = 0; j < 3; j++) {
              if (i == _yAxisPos && j == _xAxisPos) {
                _positionGrid[i][j] = Colors.green;
              } else {
                _positionGrid[i][j] = Colors.black;
              }
            }
          }
        })
      };

  void setUpInstruction() => {
        setState(() {
          _yAxisPos--;
          if (_yAxisPos < 0) {
            _yAxisPos = 1;
            _xAxisPos = 1;

            Fluttertoast.showToast(
                msg: "Te pasaste",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          setPosition();
        })
      };

  void setRInstruction() => {
        setState(() {
          _xAxisPos++;
          if (_xAxisPos > 2) {
            _yAxisPos = 1;
            _xAxisPos = 1;

            Fluttertoast.showToast(
                msg: "Te pasaste",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          setPosition();
        })
      };

  void setLInstruction() => {
        setState(() {
          _xAxisPos--;
          if (_xAxisPos < 0) {
            _yAxisPos = 1;
            _xAxisPos = 1;

            Fluttertoast.showToast(
                msg: "Te pasaste",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          setPosition();
        })
      };

  void setDownInstruction() => {
        setState(() {
          _yAxisPos++;
          if (_yAxisPos > 2) {
            _yAxisPos = 1;
            _xAxisPos = 1;

            Fluttertoast.showToast(
                msg: "Te pasaste",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
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
              child: GridView.count(
                crossAxisCount: 3,
                children: <Widget>[
                  Container(
                    color: _positionGrid[0][0],
                  ),
                  Container(
                    color: _positionGrid[0][1],
                  ),
                  Container(
                    color: _positionGrid[0][2],
                  ),
                  Container(
                    color: _positionGrid[1][0],
                  ),
                  Container(
                    color: _positionGrid[1][1],
                  ),
                  Container(
                    color: _positionGrid[1][2],
                  ),
                  Container(
                    color: _positionGrid[2][0],
                  ),
                  Container(
                    color: _positionGrid[2][1],
                  ),
                  Container(
                    color: _positionGrid[2][2],
                  ),
                ],
              ),
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
                  FlatButton(onPressed: setUpInstruction, child: Icon( Icons.arrow_upward_outlined)),
                  Container(
                    padding: const EdgeInsets.all(8),
                  ),
                  FlatButton(onPressed: setLInstruction, child: Icon( Icons.arrow_back_outlined)),
                  Container(
                    padding: const EdgeInsets.all(8),
                  ),
                  FlatButton(onPressed: setRInstruction, child: Icon( Icons.arrow_forward_outlined)),
                  Container(
                    padding: const EdgeInsets.all(8),
                  ),
                  FlatButton(
                      onPressed: setDownInstruction, child: Icon( Icons.arrow_downward_outlined)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
