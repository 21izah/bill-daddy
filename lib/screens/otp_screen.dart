import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../providers/navigation_service.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _firstPinController = TextEditingController();

  final _secondPinController = TextEditingController();

  final _thirdPinController = TextEditingController();

  final _fourthPinController = TextEditingController();
  final _fifthPinController = TextEditingController();

  final _sixthPinController = TextEditingController();

  @override
  void dispose() {
    _firstPinController.dispose();
    _secondPinController.dispose();
    _thirdPinController.dispose();
    _fourthPinController.dispose();
    _fifthPinController.dispose();
    _sixthPinController.dispose();
    super.dispose();
  }

  void openBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 250,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20),
                child: Text(
                  'Wallet Funded',
                  style: GoogleFonts.quicksand(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20, right: 0),
                child: Container(
                  width: double.infinity,
                  child: Wrap(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Your wallet has been funded with ',
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '#500 ',
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'ready ',
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'for ',
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'transactions!',
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10,
                    top: 20,
                    bottom: 10,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
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
      },
    );
  }

  bool _isTimingComplete = false;
  bool _isLoading = false;
  Future _simulateNetworkRequest() async {
    try {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(Duration(seconds: 3));
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
        openBottomSheet();
      });
    }
  }

  // final ScaffoldMessengerState _scaffold = NavigatorKey.scaffoldKey;

  void showNotificatiion() {
    // showTopSnackBar(
    //   Overlay.of(context),
    //   snackBarPosition: SnackBarPosition.top,
    //   CustomSnackBar.success(
    //     message: "Good job, your release is successful. Have a nice day",
    //   ),
    // );

    // final snackbar = SnackBar(
    //   content: Text('data'),
    //   behavior: SnackBarBehavior.floating,
    //   duration: Duration(
    //     seconds: 3,
    //   ),
    // );
    // ScaffoldMessenger.of(context)
    //   ..removeCurrentSnackBar()
    //   ..showSnackBar(snackbar);
    AnimatedSnackBar(
      duration: Duration(seconds: 3),
      builder: ((context) {
        return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green.withOpacity(0.2),
            ),
            height: 70,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.green.withOpacity(0.8),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          bottom: 0,
                          // top: 5,
                        ),
                        child: Text(
                          'Success',
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'We have sent an OTP',
                          style: GoogleFonts.quicksand(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ));
      }),
    ).show(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    showNotificatiion();

    super.initState();
  }

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  void onEnd() {
    print('onEnd');
    setState(() {
      _isTimingComplete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: _isLoading ? null : AppBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.green,
                      color: Colors.grey[200],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Please wait',
                      style: GoogleFonts.quicksand(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    'Enter OTP',
                    style: GoogleFonts.quicksand(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 20,
                    bottom: 10,
                    right: 20,
                  ),
                  child: Wrap(
                    children: [
                      Center(
                        child: Text(
                          'We have sent a 6-digit code to the number attached to the card.',
                          style: GoogleFonts.quicksand(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                content(),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _isTimingComplete
                          ? Container(
                              child: Row(
                                children: [
                                  Text(
                                    "Didn't receive code? ",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Resend ",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              child: Row(
                                children: [
                                  Text(
                                    "Resend code in ",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  CountdownTimer(
                                    endWidget: Center(
                                      child: Text(
                                        'The current time has expired',
                                        style: GoogleFonts.quicksand(
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                    endTime: endTime,
                                    onEnd: onEnd,
                                    textStyle: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                )
              ],
            ),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15,
        bottom: 20,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          height: 60,
          width: 50,
          child: TextFormField(
            controller: _firstPinController,
            cursorColor: Colors.deepOrange,
            onChanged: (value) {
              if (value.length == 1 && _firstPinController.text.isNotEmpty) {
                FocusScope.of(context).nextFocus();
              }
            },
            decoration: InputDecoration(
              // focusedBorder: OutlineInputBorder(),
              contentPadding: EdgeInsets.fromLTRB(5, 20, 5, 20),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(5),
              ),
              // hintText: 'O',
              filled: true,
              fillColor: Colors.grey[200],
              focusColor: Colors.green,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green),
                borderRadius: BorderRadius.circular(5),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.deepOrange),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            style: GoogleFonts.quicksand(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        SizedBox(
          height: 60,
          width: 50,
          child: TextFormField(
            controller: _secondPinController,
            cursorColor: Colors.deepOrange,
            onChanged: (value) {
              if (value.length == 1 && _secondPinController.text.isNotEmpty) {
                FocusScope.of(context).nextFocus();
              } else if (value.length == 0) {
                FocusScope.of(context).previousFocus();
              }
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(5),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                focusColor: Colors.green,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(5),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
            style: GoogleFonts.quicksand(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          height: 60,
          width: 50,
          child: TextFormField(
            controller: _thirdPinController,
            cursorColor: Colors.deepOrange,
            onChanged: (value) {
              if (value.length == 1 && _thirdPinController.text.isNotEmpty) {
                FocusScope.of(context).nextFocus();
              } else if (value.length == 0) {
                FocusScope.of(context).previousFocus();
              }
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(5),
                ),
                // hintText: 'O',
                filled: true,
                fillColor: Colors.grey[200],
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(5),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
            style: GoogleFonts.quicksand(
                color: Colors.black, fontWeight: FontWeight.bold),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          height: 60,
          width: 50,
          child: TextFormField(
            controller: _fourthPinController,
            cursorColor: Colors.deepOrange,
            onChanged: (value) {
              if (value.length == 1 && _fourthPinController.text.isNotEmpty) {
                FocusScope.of(context).nextFocus();
              } else if (value.length == 0) {
                FocusScope.of(context).previousFocus();
              }
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(5),
                ),
                // hintText: 'O',
                filled: true,
                fillColor: Colors.grey[200],
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(5),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
            style: GoogleFonts.quicksand(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          height: 60,
          width: 50,
          child: TextFormField(
            controller: _fifthPinController,
            cursorColor: Colors.deepOrange,
            onChanged: (value) {
              if (value.length == 1 && _fifthPinController.text.isNotEmpty) {
                FocusScope.of(context).nextFocus();
              } else if (value.length == 0) {
                FocusScope.of(context).previousFocus();
              }
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(5),
                ),
                // hintText: 'O',
                filled: true,
                fillColor: Colors.grey[200],
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(5),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
            style: GoogleFonts.quicksand(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.only(left: 5, right: 5),
          height: 60,
          width: 50,
          child: TextFormField(
            controller: _sixthPinController,
            cursorColor: Colors.deepOrange,
            onChanged: (value) {
              if (value.length == 1 && _sixthPinController.text.isNotEmpty) {
                FocusScope.of(context).unfocus();
                _simulateNetworkRequest();
              } else if (value.length == 0) {
                FocusScope.of(context).previousFocus();
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(5, 20, 5, 20),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(5),
              ),
              // hintText: 'O',
              filled: true,
              fillColor: Colors.grey[200],
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green),
                borderRadius: BorderRadius.circular(5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            style: GoogleFonts.quicksand(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
      ]),
    );
  }
}
