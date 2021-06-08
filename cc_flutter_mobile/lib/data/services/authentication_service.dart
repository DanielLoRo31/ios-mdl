import 'dart:convert';
import 'package:cc_flutter_mobile/data/model/user.dart';
import 'package:cc_flutter_mobile/data/services/api_service.dart';
import 'package:http/http.dart';

class AuthenticationService {
  Future<UserAccount> logIn(UserAccount user) async {
    try {
      final response = await post(Uri.parse(ApiService.baseUrl + "/user"), body: user);
      return jsonDecode(response.body) as UserAccount;
    } catch (e) {
      return null;
    }
  }

  Future<Map> logOut() async {
    try {
      final response = await post(Uri.parse(ApiService.baseUrl + "/user"));
      return jsonDecode(response.body);
    } catch (e) {
      return null;
    }
  }
}