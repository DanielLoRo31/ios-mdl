import 'package:flutter/material.dart';
// My packages
import 'package:cc_flutter_mobile/presentation/navigation/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CashCoin',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/edit',
    );
  }
}
