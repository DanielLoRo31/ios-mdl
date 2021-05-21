import 'package:flutter/material.dart';
// Bloc Cubit
import 'package:flutter_bloc/flutter_bloc.dart';
// My packages
import 'package:cc_flutter_mobile/presentation/screens/home/home.dart';
import 'package:cc_flutter_mobile/presentation/screens/login/login.dart';
import 'package:cc_flutter_mobile/presentation/screens/singup/signup.dart';
import 'package:cc_flutter_mobile/presentation/screens/deposit/deposit.dart';
import 'package:cc_flutter_mobile/presentation/screens/edit/edit.dart';
import 'package:cc_flutter_mobile/presentation/screens/list/list.dart';
import 'package:cc_flutter_mobile/presentation/screens/password/password.dart';
import 'package:cc_flutter_mobile/presentation/screens/settings/settings.dart';
import 'package:cc_flutter_mobile/presentation/screens/status/status.dart';
import 'package:cc_flutter_mobile/presentation/screens/transaction/transaction.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        );
      case "/login":
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        );
      case "/signup":
        return MaterialPageRoute(
          builder: (BuildContext context) => SignUpScreen(),
        );
      case "/status":
        return MaterialPageRoute(
          builder: (BuildContext context) => StatusScreen(),
        );
      case "/list":
        return MaterialPageRoute(
          builder: (BuildContext context) => ListScreen(),
        );
      case "/deposit":
        return MaterialPageRoute(
          builder: (BuildContext context) => DepositScreen(),
        );
      case "/transaction":
        return MaterialPageRoute(
          builder: (BuildContext context) => TransactionScreen(),
        );
      case "/settings":
        return MaterialPageRoute(
          builder: (BuildContext context) => SettingsScreen(),
        );
      case "/password":
        return MaterialPageRoute(
          builder: (BuildContext context) => PasswordScreen(),
        );
      case "/edit":
        return MaterialPageRoute(
          builder: (BuildContext context) => EditScreen(),
        );
      default:
        return null;
    }
  }
}