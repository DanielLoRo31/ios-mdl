class UserAccount {
  int id;
  String email;
  String password;
  String phone;

  UserAccount.fromJson(Map json) :
        id = json['accountId'],
        email = json["email"],
        password = json['password'],
        phone = json["phone"];
        // isCompleted = json["isCompleted"] == "true",
}

class UserData {
  int id;
  String name;
  String lastName;
  String code;
  double balance;
  UserAccount userAccount;

  UserData.fromJson(Map json) :
        id = json['id'],
        name = json["name"],
        lastName = json['lastName'],
        code = json["code"],
        balance = json['balance'],
        userAccount = json['userAccount'];
        // isCompleted = json["isCompleted"] == "true",
}