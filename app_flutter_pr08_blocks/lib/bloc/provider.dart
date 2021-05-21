import 'package:app_flutter_pr08_blocks/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
export 'package:app_flutter_pr08_blocks/bloc/login_bloc.dart';

class Provider extends InheritedWidget{

  final loginBlock = LoginBloc();

  Provider({Key key, Widget child})
  :super(key: key, child: child);

  static LoginBloc of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBlock;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}