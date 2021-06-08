import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:flutter/material.dart';

class CCMeterCard extends StatefulWidget {
  final String opinion;

  CCMeterCard({@required this.opinion});

  _CCMeterCardState createState() => _CCMeterCardState();
}

class _CCMeterCardState extends State<CCMeterCard> {
  final double _size = 20;
  final double _fSize1 = 15;
  final double _fSize2 = 13;
  String _content = '';
  String _title = '';
  String _opinion = '';
  Color _color;
  Color _iconColor;
  IconData _icon;

  void _giveOpinionOfYourSavings() {
    setState(() {
      _opinion = widget.opinion;
    });
    switch (_opinion) {
      case 'empty':
        setState(() {
          _title = 'Nothing to tell about you';
          _content =
              'You just have started, please deposit money\nto the account :)';
          _color = Palette.lightBlack;
          _icon = Icons.wb_twighlight;
          _iconColor = Colors.white70;
        });
        break;
      case 'really_bad':
        setState(() {
          _title = 'Mister, your doing bad';
          _content = 'You should save money...';
          _color = Colors.black;
          _icon = Icons.warning;
          _iconColor = Palette.lightBlack;
        });
        break;
      case 'bad':
        setState(() {
          _title = 'Hey! That is not good';
          _content = 'You are spending toooo much, please\nanalyse that';
          _color = Palette.redWarning;
          _icon = Icons.priority_high;
          _iconColor = Palette.lightBlack;
        });
        break;
      case 'be_careful':
        setState(() {
          _title = 'Mister, be careful';
          _content =
              'Please check you spends, you are\nstarting to lose savings';
          _color = Palette.yellowIdea;
          _icon = Icons.thumb_up;
          _iconColor = Palette.lightBlack;
        });
        break;

      case 'ok!':
        setState(() {
          _title = 'Everything ok!';
          _content = 'Continue like that  :)';
          _color = Palette.greenConfirm;
          _icon = Icons.done;
          _iconColor = Palette.lightBlack;
        });
        break;
    }
  }

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _giveOpinionOfYourSavings());
  }

  @override
  Widget build(BuildContext context) {
    var _height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = _height > 650 ? DesignSpacings.spaceM : DesignSpacings.spaceS;

    return Card(
      margin: EdgeInsets.only(bottom: 25),
      color: _color,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: Row(
          children: <Widget>[
            Icon(
              _icon,
              size: this._size,
              color: _iconColor,
            ),
            SizedBox(
              height: space / 2,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(25, 5, 15, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this._title,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: this._fSize1,
                    ),
                  ),
                  SizedBox(
                    height: space / 2,
                  ),
                  Text(
                    this._content,
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: this._fSize2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
