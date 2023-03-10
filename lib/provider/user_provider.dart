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
      token: "",
  cart: []
  );

  User get user=>_user;

  void setUser(String user){
    _user=User.fromJson(user);
    notifyListeners();
  }
  void setUserFromModel(User user){
    _user=user;
    notifyListeners();
  }
}