import 'dart:io';

import 'package:flutter/material.dart';

import '../data/api_calls/jsonProvider.dart';

import 'package:get/get.dart';

import '../screens/BottomNavigationScreens.dart';
import '../screens/home_screen.dart';
import 'navigation_service.dart';

class PurchaseDataBundleProvider with ChangeNotifier {
  // final BuildContext context;
  // SignUPpage2Provider(this.context);

  // base Url if needed

  /// setters
  //track the loading state, it controls when data is to be called and when text is to change
  bool isLoading = false;

  // track the task Process
  bool isTaskComplete = false;

// track the error message, it determines what message to be shown
  String message = '';

  // getters

  // bool get _isLoading => _isLoading;
  // String get _notificationMessage => notificationMessage;

  // task functions

  Future simulateDataBundlePurchase({
    required String amount,
    required String phone_no,
    required String provider,
    required String plan,
    BuildContext? context,
  }) async {
    // show circular progress indicator
    isLoading = true;
    notifyListeners();

    //
    void showErrorMessage(String message) {
      Get.bottomSheet(
        Container(
          height: 400,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 200,
              width: double.maxFinite,
              child: Image.asset(
                'lib/assets/warning.png',
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              message,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ]),
        ),
      );
      Future.delayed(Duration(seconds: 2), () {
        Get.back();
      });
    }

    void showSuccessMessage(String message) {
      Get.bottomSheet(
        Container(
          height: 400,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // SizedBox(
            //   height: 20,
            // ),
            Container(
              height: 200,
              width: double.maxFinite,
              child: Image.asset(
                'lib/assets/success.png',
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              message,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ]),
        ),
      );
      Future.delayed(Duration(seconds: 2), () {
        // Navigator.pop(context!);
        // PageNavigator(ctx: context).nextPageOnly(page: const SixthPage());
        Get.back();
        // Get.off(() => CreatePinScreen());
      });
    }

    try {
      // post request for registration
      await ApiProvider().PurchaseDataBundle(amount, phone_no, provider, plan);

      isLoading = false;
      notifyListeners();
      NavigatorKey.key.currentState?.pop(); // Close the bottom sheet
    } on SocketException catch (e) {
      isLoading = false;
      notifyListeners();
      showErrorMessage(e.message);
      notifyListeners();
      NavigatorKey.key.currentState?.pop(); // Close the bottom sheet
    }
  }
}
