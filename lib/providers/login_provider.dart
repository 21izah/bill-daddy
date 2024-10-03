import 'dart:io';

import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;

  String message = '';
  final _username = Hive.box('username');

  bool get isLoading => _isLoading;

  Future simulateLoginUp(
    String phoneNumber,
    String password,
    Function(String message) showSuccessMessage,
    Function(String message) showErrorMessage,
    Function() navigateToNextPage,
  ) async {
    // API endPoint URL
    var url = Uri.parse('https://billdaddy.ng/api/login');

    try {
      _isLoading = true;
      notifyListeners();

      // Request body
      var requestBody = {
        "identifier": phoneNumber,
        "password": password,
      };

      // Encode requestBody as JSON or convert to JSON format

      var body2 = convert.jsonEncode(requestBody);

      var headers = {
        'content-Type': 'application/json',
        // 'Authorization': 'Bearer ${token}'
      };

      var response = await http.post(
        url,
        body: body2,
        headers: headers,
      );

      // checking response status

      if (response.statusCode == 200 || response.statusCode == 201) {
        // show circular progress indicator
        _isLoading = true;
        notifyListeners();
        var responseData = convert.jsonDecode(response.body);

        // print(responseData);

        await _username.put('usertoken', responseData['data']['access_token']);
        await _username.put('name', responseData['data']['user']['name']);
        await _username.put('email', responseData['data']['user']['email']);
        await _username.put(
            'phone_no', responseData['data']['user']['phone_no']);
        await _username.put(
            'referral_code', responseData['data']['user']['referral_code']);

        showSuccessMessage('${responseData['message']}');
        navigateToNextPage();
      } else {
        _isLoading = true;
        notifyListeners();
        var responseData = convert.jsonDecode(response.body);
        showErrorMessage('${responseData['message']}');
      }

      _isLoading = false;
      notifyListeners();
    } on SocketException catch (e) {
      _isLoading = false;
      notifyListeners();
      showErrorMessage(e.message);
      notifyListeners();
    }
  }
}
