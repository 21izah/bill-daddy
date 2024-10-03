import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/airtime_bundle_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'navigation_service.dart';

class UserNameProvider with ChangeNotifier {
  final _username = Hive.box('username');
  bool _isLoading = false;
  dynamic _selectedUserName = '';
  dynamic _selectedDataCode = '';
  dynamic _selectedPrice = '';

  List<dynamic> _userNames = [];
  List<dynamic> _response = [];
  List<bool> _selectedStates = [];

  dynamic get selectedUserName => _selectedUserName;
  dynamic get selectedDataCode => _selectedDataCode;
  dynamic get selectedPrice => _selectedPrice;

  List<dynamic> get userNames => _userNames;
  List<dynamic> get response => _response;
  List<bool> get selectedStates => _selectedStates;
  bool get isLoading => _isLoading;

  UserNameProvider() {
    // Initialize selected states to false for each user name
    _selectedStates = List.generate(_userNames.length, (_) => false);
    print('userName function working');
    notifyListeners();
  }

  setSelectedUserName(dynamic userName) {
    _selectedUserName = userName;
    print('setSelectedUserName function working');
    notifyListeners();
  }

  setSelectedDataCode(dynamic userDataCode) {
    _selectedDataCode = userDataCode;
    print('setSelectedDatacode function working');
    notifyListeners();
  }

  setSelectedDataPrice(dynamic userDataPrice) {
    _selectedPrice = userDataPrice;
    print('setSelectedDataPrice function working');
    print('${_selectedDataCode} function working');
    notifyListeners();
  }

  setSelectedIndex(dynamic index) {
    print(_response[index]['datacode']);
    print(_response[index]['price']);
    print(_response[index]['name']);

    // for (int i = 0; i < _selectedStates.length; i++) {
    //   _selectedStates[i] = i == index;

    //   print('setSelectedState function working');

    //   notifyListeners();
    // }
    notifyListeners();
  }

  Future<AirtimeBundleModel> getBundleProviders(provider) async {
    _isLoading = true;
    notifyListeners();
    // Define the base endpoint (URL)
    final String endpoint = "https://billdaddy.ng/api/vas/bundle-plans";
    final Map<String, dynamic> queryParams = {
      'provider': provider,
    };

    // Create a Uri object with the endpoint and query parameters
    final Uri uri = Uri.parse(endpoint).replace(queryParameters: queryParams);

    var headers = {
      'content-Type': 'application/json',
      'Authorization': 'Bearer ${_username.get('usertoken')}'
    };
    // var response = await http.get(Uri.parse(url), headers: headers);
    var response = await http.get(uri, headers: headers);

    print(response.body);
    var jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
    _response = jsonData['data'];
    print(jsonData['data']);
    List<dynamic> names = _response.map((plan) => plan["name"]).toList();

    print(names);
    _userNames = names;
    notifyListeners();

    // _isLoading = false;
    // notifyListeners();

    // Initialize selected states to false for each user name
    _selectedStates = List.generate(_userNames.length, (_) => false);
    // Notify listeners after updating the data
    notifyListeners();
    for (var plan in jsonData['data']) {
      if (plan["allowance"] == "40MB" && plan["datacode"] == 49.99) {
        print("Data Code: ${plan["datacode"]}");
        print("------------");
      }
    }
    _isLoading = false;
    notifyListeners();

    if (response.statusCode == 200) {
      return AirtimeBundleModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load Api Data');
    }
  }
}
