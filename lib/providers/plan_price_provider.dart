import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/api_calls/jsonProvider.dart';

import 'package:get/get.dart';

import '../models/airtime_bundle_model.dart';
import '../models/airtime_model.dart';
import 'navigation_service.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DataProvider extends ChangeNotifier {
  final TextEditingController planController =
      TextEditingController(text: 'Select plan');

  void resetPlan() {
    planController.text = 'Select plan';
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

  List<dynamic> _response = [];

  List<dynamic> get response => _response;

  String get selectedPrice => _selectedPrice;
  String get selectedPlan => _selectedPlan;

  // bool isFirstcontainerShowing = true;

  final _username = Hive.box('username');
}
