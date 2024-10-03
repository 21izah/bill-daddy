// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, use_build_context_synchronously, depend_on_referenced_packages, unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// ignore: unused_import
import 'package:lottie/lottie.dart';

import 'login_screen.dart';
import 'sign_up_screen.dart';
import 'signin_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OnboardingPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  bool isLastPage = false;

  final urlImages = [
    'lib/assets/two_credit_card.png',
    'lib/assets/smartphone_with_bills.png',
    'lib/assets/reader_for_contactless_and_chip_with_credit_card.png',
    'lib/assets/phone_and_credit_card.png',
    'lib/assets/credit_cards.png',
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider.builder(
            itemCount: urlImages.length,
            itemBuilder: (context, index, realIndex) {
              final urlImage = urlImages[index];
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Image.asset(
                  urlImage,
                  // fit: BoxFit.cover,
                ),
              );
            },
            options: CarouselOptions(autoPlay: true),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 5,
              top: 80,
            ),
            child: Text(
              'Unified payment Hub',
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 10,
              top: 10,
            ),
            child: Text(
              'Streamline payments: Top up airtime, pay education fees, manage electricity-all in one place',
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => SignInScreen(),
                  ),
                  (route) => false);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20,
                top: 20,
                bottom: 30,
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 60,
                width: double.infinity,
                child: Text(
                  'Continue',
                  style: GoogleFonts.quicksand(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
