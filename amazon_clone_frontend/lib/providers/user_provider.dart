import 'package:amazon_clone_frontend/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier{

  UserModel _user=UserModel(id: "", name: "", email: "", password: "", type: "", address: "", token: "");

  UserModel get user => _user;

  void setUser(String user){
    _user=UserModel.fromJson(user);
    notifyListeners();
  }

}