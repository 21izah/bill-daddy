import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BalanceObscureProvider with ChangeNotifier {
  BalanceObscureProvider() {
    getBalanceObscureAtInit();
  }

  getBalanceObscureAtInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? isObscure = sharedPreferences.getBool('is_Obscure');
    if (isObscure != null && isObscure!) {
      passwordObscured = true;
      notifyListeners();
    } else {
      passwordObscured = false;
      notifyListeners();
    }
  }

  // setters
  bool passwordObscured = true;

  // simulate obscure

  void obscure() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    passwordObscured = !passwordObscured;
    notifyListeners();

    if (passwordObscured == true) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      passwordObscured = true;
      sharedPreferences.setBool('is_Obscure', true);
      notifyListeners();
    } else {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      passwordObscured = false;
      sharedPreferences.setBool('is_Obscure', false);
      notifyListeners();
    }
    notifyListeners();
  }

  // void loadData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.getBool('isObscured');
  // }
}
