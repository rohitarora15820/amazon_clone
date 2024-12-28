import 'dart:convert';

import 'package:amazon_clone_frontend/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_frontend/constants/error_handling.dart';
import 'package:amazon_clone_frontend/constants/global_variables.dart';
import 'package:amazon_clone_frontend/constants/utils.dart';

import 'package:amazon_clone_frontend/models/user_model.dart';
import 'package:amazon_clone_frontend/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  // sign up User
  void signUpUser(
      {required BuildContext context,
      required String name,
      required String email,
      required String password}) async {
    try {
      UserModel user = UserModel(
          id: "",
          name: name,
          email: email,
          password: password,
          type: "",
          address: "",
          token: "");
      http.Response res = await http.post(Uri.parse("$apiPath/api/signUp"),
          body: user.toJson(),
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, "Account Created! Login with same Credentials.");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    ;
  }

  // sign in User
  void signInUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      http.Response res = await http.post(Uri.parse("$apiPath/api/signIn"),
          body: jsonEncode({"email": email, "password": password}),
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences _pref = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await _pref.setString(
                'x-auth-token', jsonDecode(res.body)['token']);


            Navigator.pushNamedAndRemoveUntil(
                context, BottomBar.screenName, (route) => false);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // sign in User
  void getUserData({required BuildContext context}) async {
    try {
      SharedPreferences _pref = await SharedPreferences.getInstance();
      String? token = _pref.getString("x-auth-token");

      if (token == null) {
        _pref.setString("x-auth-token", "");
      }

      http.Response res = await http.post(Uri.parse("$apiPath/isValidToken"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
            "x-auth-token": token!
          });

      var tokenResponse = jsonDecode(res.body);

      if (tokenResponse == true) {
        // get USer Data
        http.Response userRes = await http.get(Uri.parse("$apiPath/"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=utf-8',
              "x-auth-token": token
            });

        var userProvider = Provider.of<UserProvider>(context, listen: false);

        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
