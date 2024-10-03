import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/airtime_bundle_model.dart';
import '../models/airtime_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DataProvider extends ChangeNotifier {
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

  List<dynamic> _response = [];

  List<dynamic> get response => _response;

  String get selectedPrice => _selectedPrice;
  String get selectedPlan => _selectedPlan;

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

  Future<AirtimeBundleModel> getBundleProviders(provider) async {
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

    // print(response.body);
    var jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
    print(jsonData['data']);
    for (var plan in jsonData['data']) {
//     print("Name: ${plan["name"]}");

      final dataPlan = plan["name"];
      print(" my network plan is ${dataPlan}");
    }

    List<dynamic> names = jsonData['data'].map((plan) => plan["name"]).toList();

    print(names);
    // print(jsonData['data']['name']);

    if (response.statusCode == 200) {
      return AirtimeBundleModel.fromJson(jsonData);
    } else {
      // Check to know if a device has an internet connection
      //     final hasInternet = await InternetConnectivity().hasInternetConnection;
      // if (hasInternet) {
      //   //You are connected to the internet
      // } else {
      //   //"No internet connection
      // }

      // Listen to internet connection changes via stream

      //     final subscription =
      //     InternetConnectivity().observeInternetConnection.listen((bool hasInternetAccess) {
      //       if(!hasInternetAccess){
      //         showToast('No Internet Connection');
      //       }
      //     });

      //  await Future.delayed(const Duration(seconds: 10 ));
      //  subscription.cancel();
      throw Exception('Failed to load Api Data');
    }
  }
}
