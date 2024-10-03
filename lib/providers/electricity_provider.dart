import 'dart:io';

import 'package:flutter/material.dart';

import '../data/api_calls/jsonProvider.dart';

import 'package:get/get.dart';

// import '../screens/BottomNavigationScreens.dart';
// import '../screens/home_screen.dart';
import '../models/electricity_model.dart';
import 'navigation_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ElectricityProvider with ChangeNotifier {
  final TextEditingController _planController =
      TextEditingController(text: 'Select plan');

  // Add a public getter for the controller
  TextEditingController get planController => _planController;
  final TextEditingController _amountController =
      TextEditingController(text: 'Amount');

  // Add a public getter for the controller
  TextEditingController get amountController => _amountController;

  void resetTexts() {
    planController.text = 'Select plan';
    amountController.text = 'Amount';
    notifyListeners(); // Notify listeners of the change
  }

  bool isLoading = false;

  // track the task Process
  bool isTaskComplete = false;

// track the error message, it determines what message to be shown
  String message = '';

  String _selectedElectricity = '';
  String _selectedicon = '';

  set selectedElectricity(String value) {
    _selectedElectricity = value;
    notifyListeners();
  }

  set selectedicon(String value) {
    _selectedicon = value;
    notifyListeners();
  }

  List<dynamic> _response = [];

  List<dynamic> get response => _response;

  String get selectedElectricity => _selectedElectricity;
  String get selectedicon => _selectedicon;

  String _selectedPrice = '';
  String _selectedPlan = '';

  set selectedPrice(String value) {
    _selectedPrice = value;
    notifyListeners();
  }

  set selectedPlan(String value) {
    _selectedPlan = value;
    notifyListeners();
  }

  void selectedPlann(value) {
    planController.text = value;
    notifyListeners(); // Notify listeners of the change
  }

  void selectedPricee(value) {
    amountController.text = value;
    notifyListeners(); // Notify listeners of the change
  }

  // List<dynamic> _response = [];

  // List<dynamic> get response => _response;

  String get selectedPrice => _selectedPrice;
  String get selectedPlan => _selectedPlan;

  // bool isFirstcontainerShowing = true;

  final _username = Hive.box('username');

  Future<ElectricityModel> getElectricityProviders() async {
    var url = 'https://billdaddy.ng/api/vas/electricity-providers';
    var headers = {
      'content-Type': 'application/json',
      'Authorization': 'Bearer ${_username.get('usertoken')}'
    };
    var response = await http.get(Uri.parse(url), headers: headers);

    var jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
    _response = jsonData['data'];

    // print(_response);
    print('my electricity ${_response[0]['name']}');

    // await _username.put('localResponse', jsonData['data']);

    if (response.statusCode == 200) {
      return ElectricityModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load Api Data');
    }
  }

  Future VerifyMeter(
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

  Future purchaseElectricity(
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
