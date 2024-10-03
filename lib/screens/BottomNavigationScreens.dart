import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:unicons/unicons.dart';

import 'account_screen.dart';
import 'customer_help_screen.dart';
import 'finance.dart';
import 'forgot_password_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';
import 'sign_up_screen.dart';
import 'signin_screen.dart';
import 'transaction_screen.dart';
import 'welcome_screen.dart';

class BottomNavigationScreens extends StatefulWidget {
  const BottomNavigationScreens({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreens> createState() =>
      _BottomNavigationScreensState();
}

class _BottomNavigationScreensState extends State<BottomNavigationScreens> {
  final pages = [
    const WelcomeScreen(),
    SignInScreen(),
    const SearchScreen(),
    AccountScreen(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: pages[selectedIndex],
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.pink,
        selectedLabelStyle: GoogleFonts.quicksand(color: Colors.green),
        unselectedLabelStyle: GoogleFonts.quicksand(color: Colors.grey),
        showUnselectedLabels: true,
        // fixedColor: Colors.deepOrange,
        iconSize: 15,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.home),
              label: 'Dashboard'),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.credit_card),
              label: 'Payments'),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.search),
              label: 'Search'),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.person,
              ),
              label: 'Account'),
        ],
      ),
    );
  }
}
