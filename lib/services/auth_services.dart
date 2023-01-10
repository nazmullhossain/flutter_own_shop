import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_ecomer_riv/const/global_varriable.dart';
import 'package:flutter_ecomer_riv/models/user_models.dart';
import 'package:flutter_ecomer_riv/provider/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const/error_handling.dart';
import '../const/utils.dart';
import '../pages/home_pages.dart';

class AuthServices {
  //sign up user

  void signupUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,


  }) async {
    try {
      User user = User(
          name: name,
          email: email,
          type: "",
          id: "",
          password: password,
          address: "",
          token: "");
    http.Response res= await http.post(Uri.parse("$uri/api/signup"),
          body:
          user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
    print(res.body);
    httpErrorHandle(response: res, context: context, onSuccess: (){
      showSnackBar(context, "account has been created");
    });
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }


  //sing in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,



  }) async {
    try {

      http.Response res= await http.post(Uri.parse("$uri/api/signin"),
          body:jsonEncode({
            "email": email,
            "password": password
          }),

          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      print(res.body);
      httpErrorHandle(response: res, context: context, onSuccess: ()async{
        final prefs = await SharedPreferences.getInstance();
     await   prefs.setString("x-auth-token", jsonDecode(res.body)['token']);
     Provider.of<UserProvider>(context,listen: false).setUser(res.body);
    Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false);
      });
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }
//get data
  void getUserData(
      BuildContext context,
      ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

//   void getUserData(
// BuildContext context) async {
//     try {
// SharedPreferences prefs=await SharedPreferences.getInstance();
// String?token=prefs.getString("x-auth-token");
//
// if(token==null){
//   prefs.setString("x-auth-token", "");
// }
//  var tokenRes=await http.post(Uri.parse("$uri/tokenIsValid"),
//  headers: <String,String>{
//    'Content-Type': 'application/json; charset=UTF-8',
//    "x-auth-token":token!
//  }
//  );
// var response=jsonDecode( tokenRes.body);
// if(response==true){
//   http.Response userRes=await http.get(Uri.parse("$uri/"),
//   headers: <String,String>{
//     'Content-Type': 'application/json; charset=UTF-8',
//     "x-auth-token":token
//   });
//   var userProvider=Provider.of<UserProvider>(context);
//   userProvider.setUser(userRes.body);
// //get user data
// }
//     } catch (error) {
//       showSnackBar(context, error.toString());
//     }
//   }

}
