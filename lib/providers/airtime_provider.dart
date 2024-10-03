import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/api_calls/jsonProvider.dart';

import 'package:get/get.dart';

import '../models/airtime_model.dart';
import 'navigation_service.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AirtimeProvider extends ChangeNotifier {
  bool isLoading = false;

  // track the task Process
  bool isTaskComplete = false;

// track the error message, it determines what message to be shown
  String message = '';

  String _selectedAirtime = '';
  String _selectedicon = '';

  set selectedAirtime(String value) {
    _selectedAirtime = value;
    notifyListeners();
  }

  set selectedicon(String value) {
    _selectedicon = value;
    notifyListeners();
  }

  List<dynamic> _response = [];

  List<dynamic> get response => _response;

  String get selectedAirtime => _selectedAirtime;
  String get selectedicon => _selectedicon;

  setSelectedAirtime(String airtimeName) {
    _selectedAirtime = airtimeName;
    notifyListeners();
  }

  Color _containerColor = Colors.grey.shade200;
  Color _containerTextColor = Colors.grey;

  Color get containerColor => _containerColor;
  Color get containerTextColor => _containerTextColor;

  void changeColor({
    required TextEditingController planController,
    required TextEditingController phoneNumberController,
    required TextEditingController amountController,
  }) {
    if (planController.text.trim().isNotEmpty &&
        phoneNumberController.text.trim().isNotEmpty &&
        amountController.text.trim().isNotEmpty) {
      _containerColor = Colors.green;
      _containerTextColor = Colors.white;
    } else {
      _containerColor = Colors.grey.shade200;
      _containerTextColor = Colors.grey;
    }
    notifyListeners();
  }

  // bool isFirstcontainerShowing = true;

  final _username = Hive.box('username');

  Future<AirtimeProviderModel> getAirtimeProviders() async {
    var url = 'https://billdaddy.ng/api/vas/mobile-providers';
    var headers = {
      'content-Type': 'application/json',
      'Authorization': 'Bearer ${_username.get('usertoken')}'
    };
    var response = await http.get(Uri.parse(url), headers: headers);

    var jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
    _response = jsonData['data'];

    await _username.put('localResponse', jsonData['data']);
    await _username.put('etisalat', jsonData['data'][3]['provider']);
    await _username.put('glo', jsonData['data'][2]['provider']);
    await _username.put('mtn', jsonData['data'][1]['provider']);
    await _username.put('airtel', jsonData['data'][0]['provider']);

    await _username.put('etisalaticon', jsonData['data'][3]['icon']);
    await _username.put('gloicon', jsonData['data'][2]['icon']);
    await _username.put('mtnicon', jsonData['data'][1]['icon']);
    await _username.put('airtelicon', jsonData['data'][0]['icon']);

    if (response.statusCode == 200) {
      return AirtimeProviderModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load Api Data');
    }
  }

  Future purchaseAirtime(
    String amount,
    String phone_no,
    String provider,
    Function(String message) showSuccessMessage,
    Function(String message) showErrorMessage,
  ) async {
    // show circular progress indicator
    isLoading = true;
    notifyListeners();

    try {
      // API endPoint URL
      var url = Uri.parse('https://billdaddy.ng/api/vas/purchase-airtime');

// Request body
      var requestBody = {
        "amount": amount,
        "phone_no": phone_no,
        "provider": provider
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

        print(responseData);
        print(Text('post request successful'));
        print('Request failed with status: ${response.statusCode}');
        showSuccessMessage('${responseData['message']}');
      } else {
        print('Request failed with status: ${response.statusCode}');
        var responseData = convert.jsonDecode(response.body);
        showErrorMessage('${responseData['message']}');
      }

      isLoading = false;
      notifyListeners();
      // NavigatorKey.key.currentState?.pop(); // Close the bottom sheet
    } on SocketException catch (e) {
      isLoading = false;
      notifyListeners();
      showErrorMessage(e.message);
      notifyListeners();
      // NavigatorKey.key.currentState?.pop(); // Close the bottom sheet
    }
  }

  Future purchaseData(
    String amount,
    String phone_no,
    String provider,
    String plan,
    Function(String message) showSuccessMessage,
    Function(String message) showErrorMessage,
  ) async {
    // show circular progress indicator
    isLoading = true;
    notifyListeners();

    try {
      // API endPoint URL
      var url = Uri.parse('https://billdaddy.ng/api/vas/purchase-data');

// Request body
      var requestBody = {
        "amount": amount,
        "phone_no": phone_no,
        "provider": provider,
        "plan": plan
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

        print(responseData);
        print(Text('post request successful'));
        print('Request failed with status: ${response.statusCode}');
        showSuccessMessage('${responseData['message']}');
      } else {
        print('Request failed with status: ${response.statusCode}');
        var responseData = convert.jsonDecode(response.body);
        showErrorMessage('${responseData['message']}');
      }

      isLoading = false;
      notifyListeners();
      // NavigatorKey.key.currentState?.pop(); // Close the bottom sheet
    } on SocketException catch (e) {
      isLoading = false;
      notifyListeners();
      showErrorMessage(e.message);
      notifyListeners();
      // NavigatorKey.key.currentState?.pop(); // Close the bottom sheet
    }
  }
}
