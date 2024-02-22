import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginProvider with ChangeNotifier {
  Future<String?> login(context, email, password) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.clear();
    try {
      prefs.setString('userName', email);
      if (client.credentials.accessToken != null) {
        Navigator.of(context).pushNamed(LoginPage.routeName);
      }
    } catch (error) {
      {
        if (error.toString().contains("invalid_grant")) {
          Fluttertoast.showToast(
              msg: "Login Error. Please login with the right User Id/Password",
              timeInSecForIosWeb: 3);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      }
    }
  }
}
