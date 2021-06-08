import 'package:cc_flutter_mobile/data/model/user.dart';

class AuthenticationRepository {
  Future<void> authenticateCredentials(UserAccount user) async {
    print('attempting login' + user.email);
    await Future.delayed(Duration(seconds: 3));
    print('logged in' + user.email + user.password);
    throw Exception('failed log in');
  }
}