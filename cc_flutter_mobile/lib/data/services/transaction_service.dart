import 'dart:convert';
import 'package:cc_flutter_mobile/data/model/transaction.dart';
import 'package:cc_flutter_mobile/data/model/user.dart';
import 'package:http/http.dart';
import 'api_service.dart';

class TransactionService {
  Future<TransactionUser> fetchUserTransactions(String code) async {
    try {
      final response = await get(Uri.parse(ApiService.baseUrl + "/transaction/find_user_t/$code"));
      return jsonDecode(response.body) as TransactionUser;
    } catch (e) {
      return null;
    }
  }

  Future<Map> makeTransaction(UserData user) async {
    try {
      final response = await post(Uri.parse(ApiService.baseUrl + "/transaction/make_t"), body: user);
      return jsonDecode(response.body);
    } catch (e) {
      return null;
    }
  }
}