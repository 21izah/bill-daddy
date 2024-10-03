import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class VerifyMeterProvider extends ChangeNotifier {
  // setters
  bool isLoading = false;

  dynamic _meterName = '';

  Map<String, dynamic> _response = {};
  //  final RegisterModel _registerModel = RegisterModel();
  final _username = Hive.box('username');

// getters
  dynamic get meterName => _meterName;
  Map<String, dynamic> get response => _response;

  // task functions

  setSelectedUserName(dynamic userName) {
    _meterName = userName;
    print('setSelectedUserName function working');
    notifyListeners();
  }

  // task funtion
  Future SimulateVerifyMeter(
    provider,
    meter_number,
  ) async {
    // show circular progress indicator
    isLoading = true;
    notifyListeners();
    // API endPoint URL
    var url = Uri.parse("http://3.138.63.43/api/vas/verify-meter");

// Request body
    var requestBody = {
      "provider": provider,
      "meter_number": meter_number,
    };

    // Encode requestBody as JSON or convert to JSON format

    var body2 = convert.jsonEncode(requestBody);
    print(body2);

    var headers = {
      'content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${_username.get('usertoken')}'
    };

    // making post Request

    var response = await http.post(
      url,
      body: body2,
      headers: headers,
    );
    print(response.body);
    // checking response status

    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseData = convert.jsonDecode(response.body);

      final name = responseData['data']['name'];

      _meterName = name;

      print('meter name is ${_meterName}');
      print(Text('post request successful'));
      print('Request failed with status: ${response.statusCode}');
      await _username.put('meterName', responseData['data']['name']);
      print(_username.get('meterName'));
      isLoading = false;
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}');
      isLoading = false;
      notifyListeners();
    }
  }
}
