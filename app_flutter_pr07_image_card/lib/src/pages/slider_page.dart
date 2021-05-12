import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 250.0;
  double _valorSliderHeight = 250.0;
  bool _bloquearCheck = false;
  bool _bloquearSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            Divider(),
            _crearSliderLargo(),
            Divider(),
            _crearCheck(),
            Divider(),
            _crearSwitch(),
            Divider(),
            _crearImagen()
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.green,
      label: 'Tamaño de imagen',
      // divisions: 20,
      value: _valorSlider,
      min: 0.0,
      max: 500.0,
      onChanged: (!_bloquearCheck)
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _crearSliderLargo() {
    return Slider(
      activeColor: Colors.green,
      label: 'Tamaño de imagen',
      // divisions: 20,
      value: _valorSliderHeight,
      min: 0.0,
      max: 500.0,
      onChanged: (!_bloquearSwitch)
          ? null
          : (valor) {
              setState(() {
                _valorSliderHeight = valor;
              });
            },
    );
  }

  Widget _crearCheck() {
    // return Checkbox(
    //   value: _bloquearCheck,
    //   activeColor: Colors.green,
    //   onChanged: (valor) {
    //     setState(() {
    //       _bloquearCheck = valor;
    //     });
    //   },
    // );
    return CheckboxListTile(
      title: Text('Bloquear Slider Horizontal'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://assets.stickpng.com/images/580b57fbd9996e24bc43c01d.png'),
      width: _valorSlider,
      height: _valorSliderHeight,
      fit: BoxFit.fill,
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Habilitar Slider Vertical'),
      value: _bloquearSwitch,
      onChanged: (valor) {
        _bloquearSwitch = valor;
      },
    );
  }
}
