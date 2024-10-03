import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/change_password_provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  child: Image.asset('lib/assets/billDaddycombine.png'),
                  height: 50,
                  width: 100,
                ),
              ),
              Center(
                child: Text('Your gateway to seamless payments!'),
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                child: Text(
                  'Forgot password',
                  style: GoogleFonts.quicksand(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20,
                  bottom: 10,
                ),
                child: Container(
                  child: Text(
                      "Enter your email address and we will send\nyou a link to reset your password."),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(1.0),
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                  style: GoogleFonts.quicksand(color: Colors.blue),
                  cursorColor: Colors.blue,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
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
                          Text('Email '),
                          Icon(
                            Icons.star,
                            color: Colors.red,
                            size: 7,
                          )
                        ],
                      ),
                      // labelText: 'Phone number',
                      labelStyle: GoogleFonts.quicksand(color: Colors.black),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Enter your email',
                      hintStyle: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: screenSize.width * 0.03),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20,
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
                    'Reset password',
                    style: GoogleFonts.quicksand(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
