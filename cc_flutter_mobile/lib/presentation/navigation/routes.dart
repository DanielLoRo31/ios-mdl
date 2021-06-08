import 'package:flutter/material.dart';
// My packages
import 'package:cc_flutter_mobile/presentation/screens/home/home.dart';
import 'package:cc_flutter_mobile/presentation/screens/signup/signup.dart';
import 'package:cc_flutter_mobile/presentation/screens/deposit/deposit.dart';
import 'package:cc_flutter_mobile/presentation/screens/edit/edit.dart';
import 'package:cc_flutter_mobile/presentation/screens/list/list.dart';
import 'package:cc_flutter_mobile/presentation/screens/password/password.dart';
import 'package:cc_flutter_mobile/presentation/screens/settings/settings.dart';
import 'package:cc_flutter_mobile/presentation/screens/status/status.dart';
import 'package:cc_flutter_mobile/presentation/screens/transaction/transaction.dart';

class AppRouter {
  static Map<String, WidgetBuilder> generateRoutes() {
    return <String, WidgetBuilder>{
      '/':  (context) => HomeScreen(),
      'signup': (context) => SignUpScreen(),
      'status': (BuildContext context) => StatusScreen(),
      'list': (BuildContext context) => ListScreen(),
      'deposit': (BuildContext context) => DepositScreen(),
      'transaction': (BuildContext context) => TransactionScreen(),
      'settings': (BuildContext context) => SettingsScreen(),
      'password': (BuildContext context) => PasswordScreen(),
      'edit': (BuildContext context) => EditScreen()
    };
  }
}
