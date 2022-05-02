import 'dart:convert';

class UserModel {
  final String? name;
  final String? photoURL;
  final String? email;
  final String? nameComplete;
  final String? userName;
  final String? id;

  UserModel(
      {this.id,
      this.name,
      this.photoURL,
      this.email,
      this.nameComplete,
      this.userName});

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "photoURL": photoURL,
        "email": email,
        "userName": userName,
        "nameComplete": nameComplete
      };

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map['id'],
        name: map['name'],
        photoURL: map['photoURL'],
        email: map['email'],
        nameComplete: map['nameComplete'],
        userName: map['userName']);
  }

  String toJson() => jsonEncode(toMap());
}
