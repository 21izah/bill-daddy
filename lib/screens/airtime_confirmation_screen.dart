import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../providers/airtime_provider.dart';
import 'package:intl/intl.dart';

class AirtimeConfirmationScreen extends StatefulWidget {
  final String provider;
  final String name;
  final String phoneNumber;
  final String amount;
  const AirtimeConfirmationScreen(
      {super.key,
      required this.provider,
      required this.name,
      required this.phoneNumber,
      required this.amount});

  @override
  State<AirtimeConfirmationScreen> createState() =>
      _AirtimeConfirmationScreenState();
}

class _AirtimeConfirmationScreenState extends State<AirtimeConfirmationScreen> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    String currencyString = '#2500000000'; // Your currency string
    NumberFormat currencyFormat = NumberFormat.currency(symbol: '#');
    String formattedCurrency =
        currencyFormat.format(int.parse(currencyString.substring(1)));
    // String AmountcurrencyString = widget.amount; // Your currency string

    // String AmountformattedCurrency =
    //     currencyFormat.format(int.parse(AmountcurrencyString.substring(1)));

    String AmountcurrencyString = widget.amount; // Your currency string
    num AmountformattedCurrency =
        currencyFormat.parse(AmountcurrencyString.substring(1));

    // String AmountformattedCurrency =
    //     currencyFormat.format(int.parse(AmountcurrencyString.substring(1)));

    // double parsedAmount = AmountformattedCurrency.toDouble();

    return Consumer<AirtimeProvider>(
      builder: (context, si, child) => Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: si.isLoading
            ? null
            : AppBar(
                title: Text(
                  'Confirm payment',
                  style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
                ),
                centerTitle: false,
                backgroundColor: Colors.grey[100],
              ),
        body: si.isLoading
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
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Payment Option',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Wallet',
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 7.0, left: 1),
                                  child: CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Colors.transparent,
                                    child: Image.asset(
                                      'lib/assets/down.png',
                                      fit: BoxFit.contain,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Divider(
                            color: Colors.grey[300],
                            endIndent: 0,
                            indent: 0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Walllet Balance',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  formattedCurrency,
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Payment Summary',
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
                              Text(
                                'Provider',
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    widget.provider.toUpperCase(),
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Divider(
                            color: Colors.grey[300],
                            endIndent: 0,
                            indent: 0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Name',
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    widget.name,
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Divider(
                            color: Colors.grey[300],
                            endIndent: 0,
                            indent: 0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Phone No',
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    widget.phoneNumber,
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Divider(
                            color: Colors.grey[300],
                            endIndent: 0,
                            indent: 0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Amount',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${AmountformattedCurrency.toStringAsFixed(2)}', // Convert double to string with two decimal places
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(
                            'Save Beneficiary',
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Container(
                          height: screenSize.height * 0.015,
                          child: Switch.adaptive(
                            activeColor: Colors.green,
                            activeTrackColor: Colors.white,
                            inactiveThumbColor: Colors.red,
                            inactiveTrackColor: Colors.white,
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      si.purchaseAirtime(
                        AmountformattedCurrency.toStringAsFixed(2),
                        widget.phoneNumber,
                        widget.provider,
                        (message) => showTopSnackBar(
                          snackBarPosition: SnackBarPosition.top,
                          Overlay.of(context),
                          CustomSnackBar.success(
                            message: message,
                          ),
                        ),
                        (message) => showTopSnackBar(
                          snackBarPosition: SnackBarPosition.top,
                          Overlay.of(context),
                          CustomSnackBar.error(
                            message: message,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20,
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
                        width: screenSize.width,
                        child: Text(
                          'Complete payment',
                          style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
