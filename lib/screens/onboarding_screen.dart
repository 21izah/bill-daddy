import 'package:flutter/material.dart';

import 'onboarding_page.dart';
import 'signin_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetoWelcomePage();
  }

  _navigatetoWelcomePage() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => OnboardingPage(),
        ),
        (route) => false);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          child: Image.asset(
            'lib/assets/billDaddycombine.png', color: Colors.white,
            // fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
