import 'package:flutter/cupertino.dart';

import '../models/user_models.dart';

class UserProvider extends ChangeNotifier{
  User _user =User(
      email: '',
      name: '',
      type: '',
      id: '',
      password: '',
      address: '',
      token: "");

  User get user=>_user;

  void setUser(String user){
    _user=User.fromJson(user);
    notifyListeners();
  }
}