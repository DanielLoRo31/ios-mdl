import 'dart:convert';
import 'package:cc_flutter_mobile/data/model/user.dart';
import 'package:cc_flutter_mobile/data/services/api_service.dart';
import 'package:http/http.dart';

class UserService {
  Future<UserData> fetchUserByEmail(String email) async {
    try {
      final response = await get(Uri.parse(ApiService.baseUrl + "/user/$email"));
      return jsonDecode(response.body) as UserData;
    } catch (e) {
      return null;
    }
  }

  Future<Map> addUser(UserData user) async {
    try {
      final response = await post(Uri.parse(ApiService.baseUrl + "/user"), body: user);
      return jsonDecode(response.body);
    } catch (e) {
      return null;
    }
  }

  Future<Map> updateUser(UserData user) async {
    try {
      final response = await put(Uri.parse(ApiService.baseUrl + "/user"), body: user);
      return jsonDecode(response.body);
    } catch (e) {
      return null;
    }
  }

  Future<Map> deleteUser(int id) async {
    try {
      final response = await delete(Uri.parse(ApiService.baseUrl + "/user"));
      return jsonDecode(response.body);
    } catch (er) {
      return null;
    }
  }

}