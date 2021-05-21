import 'dart:async';

import 'package:app_flutter_pr08_blocks/bloc/validators.dart';


class LoginBloc with Validators{
  //stream nos va a servir para controlar el flujo y cambios en las propiedades de niveles bajos
  final _emailController = StreamController<String>.broadcast();

  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);

  Function(String) get changeEmail => _emailController.sink.add; // crear una referencia

  final _passwordController = StreamController<String>.broadcast();

  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

  Function(String) get changePassword => _passwordController.sink.add; // crear una referencia


  final _userController = StreamController<Map<String,String>>.broadcast();

  Stream<Map<String,String>> get userStream => _userController.stream;

  Function(Map<String,String>) get changeUser => _userController.sink.add;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
    _userController?.close();
  }
}