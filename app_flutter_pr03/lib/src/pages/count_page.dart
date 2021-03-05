import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CountPage extends StatefulWidget {
  @override
  createState() {
    return CountPageState();
  }
}

class CountPageState extends State<CountPage> {
  final _style = new TextStyle(fontSize: 30, color: Colors.blue);
  final _style2 = new TextStyle(fontSize: 20, color: Colors.black38);
  final tlimit = 10;
  final blimit = -10;
  String _adv = "";
  int _yAxisPos = 0;
  String _staticPosString =  'n';
  int _staticPos =  0;

  void setUpInstruction() => {
        setState(() {
          _yAxisPos++;

          if (_yAxisPos >= tlimit) {
            _yAxisPos = 10;
            _adv = "You on the limit of the page, cant move forward";

            Fluttertoast.showToast(
                msg: _adv,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
        })
      };

  void setRInstruction() => {
    setState(() {
      _staticPos++;

      if(_staticPos > 3)
        _staticPos = 0;

      switch(_staticPos) {
        case 0: {
          _staticPosString = 'n';
          break;
        }
        case 1: {
          _staticPosString = 'e';
          break;
        }
        case 2: {
          _staticPosString = 's';
          break;
        }
        case 3: {
          _staticPosString = 'o';
          break;
        }
      }
    })
  };

  void setLInstruction() => {
    setState(() {
      _staticPos--;

      if(_staticPos < 0)
        _staticPos = 3;

      switch(_staticPos) {
        case 0: {
          _staticPosString = 'n';
          break;
        }
        case 1: {
          _staticPosString = 'e';
          break;
        }
        case 2: {
          _staticPosString = 's';
          break;
        }
        case 3: {
          _staticPosString = 'o';
          break;
        }
      }
    })
  };

  void setDownInstruction() => {
    setState(() {
      _yAxisPos--;

      if (_yAxisPos <= blimit) {
        _yAxisPos = 0;
        _adv = "You on the limit of the page, cant move back";

        Fluttertoast.showToast(
            msg: _adv,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    })
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (Text('Hello Human c:, those are the instructions: ', style: _style)),
            (Text('$_staticPosString', style: _style2)),
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
                  FlatButton(onPressed: setUpInstruction, child: Text('up')),
                  Container(
                    padding: const EdgeInsets.all(8),
                  ),
                  FlatButton(onPressed: setLInstruction, child: Text('left')),
                  Container(
                    padding: const EdgeInsets.all(8),
                  ),
                  FlatButton(onPressed: setRInstruction, child: Text('right')),
                  Container(
                    padding: const EdgeInsets.all(8),
                  ),
                  FlatButton(onPressed: setDownInstruction, child: Text('down')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
