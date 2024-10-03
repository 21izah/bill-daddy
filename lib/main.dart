import 'package:billdaddddy/providers/electricity_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'models/referral_balance_0bsure_provider.dart';
import 'providers/airtime_provider.dart';
import 'providers/balance_obscure_provider.dart';
import 'providers/cable_provider.dart';
import 'providers/data_provider.dart';
import 'providers/login_provider.dart';
import 'providers/navigation_service.dart';
import 'providers/sign_up_provider.dart';
import 'screens/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("username");
  await Hive.openBox("mybox");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BalanceObscureProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ReferalReferalBalanceObscureProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AirtimeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CableProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ElectricityProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      navigatorKey: NavigatorKey.key,
      scaffoldMessengerKey: NavigatorKey.scaffoldKey,
      home: OnboardingScreen(),
    );
  }
}


// flutter run --release

// final ScaffoldMessengerState _scaffold = _scaffoldKey.currenctState;