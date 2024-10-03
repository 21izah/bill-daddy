import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';

import 'change_password.dart';
import 'profile_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _username = Hive.box('username');

  @override
  Widget build(BuildContext context) {
    String usersName = '${_username.get('name')}';
    // Find the index of the first space character
    int spaceIndex = usersName.indexOf(' ');
    String firstName = usersName.substring(0, spaceIndex);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageTransition(
                    child: ProfilePage(),
                    type: PageTransitionType.fade,
                    duration: Duration(seconds: 1)),
              );
            },
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            // openBottomSheet();
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            radius: 30,
                            child: Icon(Icons.person_2_outlined),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 35,
                        left: 45,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.white,
                            ),
                            color: Colors.grey[200],
                          ),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Hello, ${firstName}!',
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Personal data',
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(
                            'lib/assets/user.png',
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              '${_username.get('name')}',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(
                            'lib/assets/phone-call.png',
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone Number',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              '${_username.get('phone_no')}',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(
                            'lib/assets/email.png',
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              '${_username.get('email')}',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Account Management',
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageTransition(
                                child: ChangePassword(),
                                type: PageTransitionType.fade,
                                duration: Duration(seconds: 1)),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.transparent,
                                child: Image.asset(
                                  'lib/assets/padlock.png',
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Change Password',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.transparent,
                            child: Image.asset(
                              'lib/assets/next.png',
                              color: Colors.black,

                              // fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.transparent,
                              child: Image.asset(
                                'lib/assets/gift.png',
                                color: Colors.green,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Vouchers',
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.transparent,
                            child: Image.asset(
                              'lib/assets/next.png',
                              color: Colors.black,

                              // fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.transparent,
                              child: Image.asset(
                                'lib/assets/bell.png',
                                color: Colors.green,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Notifications',
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.transparent,
                            child: Image.asset(
                              'lib/assets/next.png',
                              color: Colors.black,

                              // fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.transparent,
                              child: Image.asset(
                                'lib/assets/history.png',
                                color: Colors.green,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Login History',
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.transparent,
                            child: Image.asset(
                              'lib/assets/next.png',
                              color: Colors.black,

                              // fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.transparent,
                              child: Image.asset(
                                'lib/assets/people.png',
                                color: Colors.green,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Referrals',
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.transparent,
                            child: Image.asset(
                              'lib/assets/next.png',
                              color: Colors.black,

                              // fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.transparent,
                              child: Image.asset(
                                'lib/assets/chat.png',
                                color: Colors.green,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Contact Us',
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.transparent,
                            child: Image.asset(
                              'lib/assets/next.png',
                              color: Colors.black,

                              // fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
