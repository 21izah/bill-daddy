import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'otp_screen.dart';

import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class FundWalletScreen extends StatefulWidget {
  const FundWalletScreen({super.key});

  @override
  State<FundWalletScreen> createState() => _FundWalletScreenState();
}

class _FundWalletScreenState extends State<FundWalletScreen> {
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();

  final _cvvController = TextEditingController();

  final _cardPinController = TextEditingController();
  final _amountController = TextEditingController();

  Color _containerColor = Colors.grey.shade200;
  Color _containerTextColor = Colors.grey;

  bool isFirstcontainerShowing = true;

  bool _isLoading = false;

  void _changeContainer() {
    setState(() {
      isFirstcontainerShowing = !isFirstcontainerShowing;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _amountController.addListener(_changeColor);
    super.initState();
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _cardPinController.dispose();
    _amountController.dispose();

    super.dispose();
  }

  void _changeColor() {
    setState(() {
      if (_amountController.text.trim().isNotEmpty) {
        _containerColor = Colors.green;
        _containerTextColor = Colors.white;
      } else {
        _containerColor = Colors.grey.shade200;
        _containerTextColor = Colors.grey;
      }
    });
  }

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
        Navigator.of(context).push(
          PageTransition(
            child: OtpScreen(),
            type: PageTransitionType.fade,
          ),
        );
      });
    }
  }

  DateTime dateTime = DateTime(2000, 2, 1, 10, 20);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: _isLoading
            ? null
            : AppBar(
                title: Text(
                  'Fund wallet',
                  style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
                ),
                centerTitle: false,
                backgroundColor: Colors.grey[100],
              ),
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
            : isFirstcontainerShowing
                ? Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            height: screenSize.height * 0.2,
                            width: screenSize.width - 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20.0,
                                    top: 20,
                                    bottom: 10,
                                  ),
                                  child: Text(
                                    'wallet address',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20.0,
                                    bottom: 20,
                                  ),
                                  child: Text(
                                    '7062912340',
                                    style: GoogleFonts.quicksand(
                                        fontSize: 18,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    'Amount',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(1.0),
                                  margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                  child: TextFormField(
                                    inputFormatters: [
                                      CurrencyInputFormatter(
                                        leadingSymbol: '#',
                                        mantissaLength: 0,
                                      )
                                    ],
                                    style: GoogleFonts.quicksand(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                    keyboardType: TextInputType.number,
                                    cursorColor: Colors.green,
                                    controller: _amountController,
                                    decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Colors.black,
                                      )),

                                      // OutlineInputBorder(
                                      //   borderSide: BorderSide(color: Colors.black),
                                      //   // borderRadius: BorderRadius.circular(5),
                                      // ),
                                      contentPadding: EdgeInsets.only(
                                        left: 0,
                                        top: 10,
                                        right: 10,
                                        bottom: 10,
                                      ),

                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,

                                      hintStyle: GoogleFonts.quicksand(
                                          color: Colors.black,
                                          fontSize: screenSize.width * 0.03),
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Text('${dateTime.month}/${dateTime.year}'),
                        GestureDetector(
                          onTap: () {
                            _changeContainer();
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
                                color: _containerColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              height: 60,
                              width: screenSize.width,
                              child: Text(
                                'Proceed',
                                style: GoogleFonts.quicksand(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: _containerTextColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Wrap(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      child: Text(
                                        'An otp will be sent to the phone number attached to the card to complete this transaction.',
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900],
                                        ),
                                      ),
                                      height: screenSize.height * 0.08,
                                      width: screenSize.width - 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blue.withOpacity(0.05),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(1.0),
                                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: TextFormField(
                                  inputFormatters: [
                                    CreditCardNumberInputFormatter()
                                  ],
                                  style:
                                      GoogleFonts.quicksand(color: Colors.blue),
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.number,
                                  controller: _cardNumberController,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                        left: 15,
                                        top: 10,
                                        right: 10,
                                        bottom: 10,
                                      ),
                                      label: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('Card number '),
                                          Icon(
                                            Icons.star,
                                            color: Colors.red,
                                            size: 7,
                                          )
                                        ],
                                      ),

                                      // labelText: 'Phone number',
                                      labelStyle: GoogleFonts.quicksand(
                                          color: Colors.black),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      hintText:
                                          '- - - - - - - - - - - - - - - -',
                                      hintStyle: GoogleFonts.quicksand(
                                          color: Colors.black,
                                          fontSize: screenSize.width * 0.05),
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: screenSize.width * 0.4,
                                    padding: const EdgeInsets.all(1.0),
                                    margin: EdgeInsets.fromLTRB(20, 5, 5, 5),
                                    child: TextFormField(
                                      inputFormatters: [
                                        CreditCardExpirationDateFormatter()
                                      ],
                                      style: GoogleFonts.quicksand(
                                          color: Colors.blue),
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.phone,
                                      controller: _expiryDateController,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                            left: 15,
                                            top: 10,
                                            right: 10,
                                            bottom: 10,
                                          ),
                                          label: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('Expiry date '),
                                              Icon(
                                                Icons.star,
                                                color: Colors.red,
                                                size: 7,
                                              )
                                            ],
                                          ),
                                          // labelText: 'Phone number',
                                          labelStyle: GoogleFonts.quicksand(
                                              color: Colors.black),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          hintText:
                                              '${dateTime.month} /${dateTime.year}',
                                          hintStyle: GoogleFonts.quicksand(
                                              color: Colors.black,
                                              fontSize:
                                                  screenSize.width * 0.03),
                                          filled: true,
                                          fillColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                    ),
                                  ),
                                  Container(
                                    width: screenSize.width * 0.42,
                                    padding: const EdgeInsets.all(1.0),
                                    margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
                                    child: TextFormField(
                                      inputFormatters: [
                                        CreditCardCvcInputFormatter()
                                      ],
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Phone Number is required';
                                        }
                                        return null;
                                      },
                                      style: GoogleFonts.quicksand(
                                          color: Colors.blue),
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.phone,
                                      controller: _cvvController,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                            left: 15,
                                            top: 10,
                                            right: 10,
                                            bottom: 10,
                                          ),
                                          label: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('CVV '),
                                              Icon(
                                                Icons.star,
                                                color: Colors.red,
                                                size: 7,
                                              )
                                            ],
                                          ),
                                          // labelText: 'Phone number',
                                          labelStyle: GoogleFonts.quicksand(
                                              color: Colors.black),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          hintText: '- - -',
                                          hintStyle: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize:
                                                  screenSize.width * 0.05),
                                          filled: true,
                                          fillColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(1.0),
                                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: TextFormField(
                                  maxLength: 4,
                                  obscureText: true,
                                  style:
                                      GoogleFonts.quicksand(color: Colors.blue),
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.number,
                                  controller: _cardPinController,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                        left: 15,
                                        top: 10,
                                        right: 10,
                                        bottom: 10,
                                      ),
                                      label: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('Card pin '),
                                          Icon(
                                            Icons.star,
                                            color: Colors.red,
                                            size: 7,
                                          )
                                        ],
                                      ),
                                      // labelText: 'Phone number',
                                      labelStyle: GoogleFonts.quicksand(
                                          color: Colors.black),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      hintText: '- - - -',
                                      hintStyle: GoogleFonts.quicksand(
                                          color: Colors.black,
                                          fontSize: screenSize.width * 0.05),
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                ),
                              ),
                            ],
                          ),
                          height: screenSize.height * 0.25,
                          width: screenSize.width - 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _simulateNetworkRequest();
                            // Navigator.of(context).push(
                            //   PageTransition(
                            //     child: OtpScreen(),
                            //     type: PageTransitionType.fade,
                            //   ),
                            // );
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
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              height: 60,
                              width: screenSize.width,
                              child: Text(
                                'Confirm',
                                style: GoogleFonts.quicksand(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
