import 'package:flutter/material.dart';

class UserModel {
  String? email;
  String? password;

  UserModel({this.email, this.password});
}

class UserProvider with ChangeNotifier {
  UserModel _user = UserModel();

  UserModel get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}
