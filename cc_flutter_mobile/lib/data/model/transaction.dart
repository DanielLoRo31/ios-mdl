import 'package:cc_flutter_mobile/data/model/user.dart';

class TransactionType {
  int id;
  String typeDescription;

  TransactionType.fromJson(Map json)
      : id = json['id'],
        typeDescription = json["transactionType"];
}

class TransactionOrder {
  int id;
  double quantity;
  String date;
  TransactionType transactionType;

  TransactionOrder.fromJson(Map json)
      : id = json['id'],
        quantity = json["quantity"],
        date = json['date'],
        transactionType = json['transactionType'];
}

class TransactionDetail {
  int id;
  UserData destination;
  UserData origin;
  String concept;
  TransactionOrder order;

  TransactionDetail.fromJson(Map json)
      : id = json['accountId'],
        destination = json["destination"],
        origin = json['origin'],
        concept = json['concept'],
        order = json['transactionOrder'];
// isCompleted = json["isCompleted"] == "true",
}

class TransactionUser {
  int id;
  UserData userData;
  TransactionDetail transactionDetail;
  String transactionUserType;
  int transactionUserStatus;

  TransactionUser(
      {this.id = 0,
      this.userData,
      this.transactionDetail,
      this.transactionUserType,
      this.transactionUserStatus = 0});

  TransactionUser.fromJson(Map json)
      : id = json['id'],
        userData = json["userData"],
        transactionDetail = json['transactionDetail'],
        transactionUserType = json['transactionUType'],
        transactionUserStatus = json['transactionUStatus'];
}
