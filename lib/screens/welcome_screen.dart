import 'package:billdaddddy/screens/electricity_screen.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../models/referral_balance_0bsure_provider.dart';
import '../providers/balance_obscure_provider.dart';
import 'airtime_purchase_screen.dart';
import 'cable_screen.dart';
import 'data_screen.dart';
import 'fund_wallet_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';
import 'package:intl/intl.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool passwordObscured = true;
  final _username = Hive.box('username');

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    String currencyString = '#2500000000'; // Your currency string
    NumberFormat currencyFormat = NumberFormat.currency(symbol: '#');
    String formattedCurrency =
        currencyFormat.format(int.parse(currencyString.substring(1)));

    // Parse the datetime string
    String datetimeString = "2024-03-10T19:40:10.000000Z";
    DateTime dateTime = DateTime.parse(datetimeString);

    // Format the datetime object into the desired format
    String formattedDate =
        DateFormat('EEE, MMM d\'\'th y\'\'t').format(dateTime);

    print(formattedDate); // Output: Sun, Mar 10'th 7 2024

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: screenSize.height * 0.25,
                decoration: BoxDecoration(
                  color: Colors.green[700],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  PageTransition(
                                    child: ProfilePage(),
                                    type: PageTransitionType.fade,
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                radius: 23,
                                backgroundColor: Colors.white.withOpacity(0.4),
                                child: Icon(
                                  Icons.person_4_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Hi, ${_username.get('name')}',
                                style: GoogleFonts.quicksand(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageTransition(
                              child: NotificationScreen(),
                              type: PageTransitionType.fade,
                            ),
                          );
                        },
                        child: Container(
                          child: Badge(
                            // label: Text('.'),
                            offset: Offset(-15, -5),
                            largeSize: 16,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.notifications_none_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: screenSize.height * 0.75,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
              ),
            ],
          ),
          Positioned(
            top: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Account No: Wema Bank | 93912324324 ',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600],
                                      fontSize: 17,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      copyAndShowMessage() {
                                        FlutterClipboard.copy('2083912405');

                                        showTopSnackBar(
                                          snackBarPosition:
                                              SnackBarPosition.top,
                                          Overlay.of(context),
                                          const CustomSnackBar.success(
                                            message:
                                                'Account Number Copied To clipboard',
                                          ),
                                        );
                                      }

                                      copyAndShowMessage();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        // color: Colors.deepOrange,
                                      ),
                                      margin:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Icon(
                                        Icons.copy_rounded,
                                        size: 20,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: screenSize.width * .8,
                                    color: Colors.transparent,
                                    child: Row(
                                      children: [
                                        Consumer<BalanceObscureProvider>(
                                          builder: (context, ki, child) => ki
                                                  .passwordObscured
                                              ? Text(
                                                  formattedCurrency,
                                                  style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                )
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: Text(
                                                    '*******',
                                                    style:
                                                        GoogleFonts.quicksand(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                  ),
                                                ),
                                        ),
                                        Consumer<BalanceObscureProvider>(
                                          builder: (context, si, child) =>
                                              GestureDetector(
                                            onTap: () => si.obscure(),
                                            child: si.passwordObscured
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 5.0,
                                                      top: 7,
                                                    ),
                                                    child: Icon(
                                                      size: screenSize.height *
                                                          0.02,
                                                      Icons.visibility,
                                                      color: Colors.grey[600],
                                                    ),
                                                  )
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 5.0,
                                                      top: 7,
                                                    ),
                                                    child: Icon(
                                                      Icons.visibility_off,
                                                      color: Colors.grey[600],
                                                      size: screenSize.height *
                                                          0.02,
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          PageTransition(
                                            child: FundWalletScreen(),
                                            type: PageTransitionType.fade,
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '+ Fund wallet',
                                            style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          height: screenSize.height * 0.05,
                                          width: screenSize.width * 0.4,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 10,
                                        left: 10,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 5.0,
                                          bottom: 0,
                                        ),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'lib/assets/Vectorrightarrow.png',
                                                color: Colors.green,
                                                // fit: BoxFit.contain,
                                              ),
                                              Text(
                                                'Refer a friend',
                                                style: GoogleFonts.quicksand(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                          height: screenSize.height * 0.05,
                                          width: screenSize.width * 0.4,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.green),
                                          ),
                                        ),
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
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: screenSize.height * 0.19,
                    width: screenSize.width - 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageTransition(
                                child: AirtimeScreen(),
                                type: PageTransitionType.fade,
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.green.withOpacity(0.1),
                                child: Image.asset(
                                  'lib/assets/airtime_1.png',
                                  color: Colors.green,
                                  // fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Airtime',
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageTransition(
                                child: DataScreen(),
                                type: PageTransitionType.fade,
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.green.withOpacity(0.1),
                                child: Image.asset(
                                  'lib/assets/Vectordata.png',
                                  color: Colors.green,
                                  // fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Data',
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageTransition(
                                child: CableScreen(),
                                type: PageTransitionType.fade,
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  radius: 25,
                                  backgroundColor:
                                      Colors.green.withOpacity(0.1),
                                  child: Image.asset(
                                    'lib/assets/cable 1.png',
                                    color: Colors.green,
                                    // fit: BoxFit.contain,
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Cable TV',
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageTransition(
                                child: ElectricityScreen(),
                                type: PageTransitionType.fade,
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.green.withOpacity(0.1),
                                child: Image.asset(
                                  'lib/assets/electricity 1.png',
                                  color: Colors.green,
                                  // fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Electricity',
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: screenSize.height * 0.12,
                    width: screenSize.width - 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    width: screenSize.width - 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            child: Text(
                              'Transaction History',
                              style: GoogleFonts.quicksand(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                // child: Text(
                                //   'See more >',
                                //   style: GoogleFonts.quicksand(
                                //     fontSize: 17,
                                //     fontWeight: FontWeight.bold,
                                //     color: Colors.grey,
                                //   ),
                                // ),
                                ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Image.asset(
                              'lib/assets/insurance_agreement_blue.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            'No transactions recorded.',
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: screenSize.height * 0.3,
                    width: screenSize.width - 20,
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
