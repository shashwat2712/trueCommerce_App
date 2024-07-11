import 'dart:convert';
import 'package:amazon_clone_node_js_flutter_app_new/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_node_js_flutter_app_new/constants/error_handling.dart';
import 'package:amazon_clone_node_js_flutter_app_new/constants/global_variable.dart';
import 'package:amazon_clone_node_js_flutter_app_new/constants/utils.dart';
import 'package:amazon_clone_node_js_flutter_app_new/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../providers/user_provider.dart';

class AuthService {
  //function for signing up the user
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
        cart: [],
      );
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, 'Account Created ! Login with the same credentials!');
          });
      // ignore: use_build_context_synchronously
    } catch (e) {
      showSnackBar(context, '$e');
    }
    // ignore: use_build_context_synchronously
  }

  //sign in user
  void signInUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      // ignore: use_build_context_synchronously
      print(res.body);
      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
              context,
              BottomBar.routeName,
              (route) => false,
            );
          }); // ignore: use_build_context_synchronously
    } catch (e) {
      showSnackBar(context, '$e');
    }
    // ignore: use_build_context_synchronously
  }

  void getUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      print('/////////////////////////////////////');
      print(token);
      print('/////////////////////////////////////');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(Uri.parse('$uri/tokenIsValid'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          });
      var response = jsonDecode(tokenRes.body);
      print('/////////////////////////////////////');
      print(response);
      print('/////////////////////////////////////');
      if (response == true) {
        http.Response userRes = await http.get(Uri.parse('$uri/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token
            });
        print('/////////////////////////////////////');
        print(userRes.body);
        print('/////////////////////////////////////');
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      print('$e');
    }
    // ignore: use_build_context_synchronously
  }
}
