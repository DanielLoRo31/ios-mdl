import 'package:cc_flutter_mobile/data/model/user.dart';

class UserRepository {
  Future<UserData> findAccountByEmail(String email) async {
    print('returning info from email' + email);
    UserData _user = new UserData(
      id: 1,
    );

    return _user;
  }

  Future<void> registerAccount() async {
    print('attempting login');
    await Future.delayed(Duration(seconds: 3));
    print('logged in');
    throw Exception('failed log in');
  }

  Future<void> editAccount() async {
    print('attempting login');
    await Future.delayed(Duration(seconds: 3));
    print('logged in');
    throw Exception('failed log in');
  }

  Future<void> deleteAccount() async {
    print('attempting login');
    await Future.delayed(Duration(seconds: 3));
    print('logged in');
    throw Exception('failed log in');
  }
}