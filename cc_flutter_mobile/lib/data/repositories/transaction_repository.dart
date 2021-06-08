import 'package:cc_flutter_mobile/data/model/transaction.dart';

class TransactionRepository {
  Future<List<TransactionUser>> findUserTransactions(String code) async {
    print('returning info from code' + code);
    List<TransactionUser> transactions = [];
    TransactionUser test = new TransactionUser(
        id: 1,
    );
    transactions.add(test);

    return transactions;
  }

  Future<void> makeTransaction() async {
    print('attempting login');
    await Future.delayed(Duration(seconds: 3));
    print('logged in');
    throw Exception('failed log in');
  }
}
