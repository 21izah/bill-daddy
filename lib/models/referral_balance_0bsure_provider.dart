import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReferalReferalBalanceObscureProvider with ChangeNotifier {
  BalanceObscureProvider() {
    getBalanceObscureAtInit();
  }

  getBalanceObscureAtInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? isObscure = sharedPreferences.getBool('is_refObscure');
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
      sharedPreferences.setBool('is_refObscure', true);
      notifyListeners();
    } else {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      passwordObscured = false;
      sharedPreferences.setBool('is_refObscure', false);
      notifyListeners();
    }
    notifyListeners();
  }

  // void loadData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.getBool('isObscured');
  // }
}
