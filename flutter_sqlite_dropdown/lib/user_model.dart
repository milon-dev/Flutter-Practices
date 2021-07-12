class UserModel {

  String name;
  String email;
  String username;
  String password;

  UserModel(
      this.name,
      this.email,
      this.username,
      this.password,

      );

  UserModel.fromMap(dynamic obj) {
    this.name = obj["name"];
    this.email = obj["email"];
    this.username = obj["username"];
    this.password = obj["password"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["name"] = name;
    map["email"] = email;
    map["username"] = username;
    map["password"] = password;

    return map;
  }

  //Getters
  String get getName => name;
  String get getUsername => username;
  String get getPassword => password;
  String get getEmail => email;
}