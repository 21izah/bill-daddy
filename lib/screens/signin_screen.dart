import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../providers/login_provider.dart';
import 'BottomNavigationScreens.dart';
import 'forgot_password_screen.dart';
import 'sign_up_screen.dart';
import 'welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();

  final _passwordController = TextEditingController();

  bool passwordObscured = true;

  final LoginProvider _loginProvider = LoginProvider();

  Color _containerColor = Colors.grey.shade200;
  Color _containerTextColor = Colors.grey;

  void _changeColor() {
    setState(() {
      if (_phoneNumberController.text.trim().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty) {
        _containerColor = Colors.green;
        _containerTextColor = Colors.white;
      } else {
        _containerColor = Colors.grey.shade200;
        _containerTextColor = Colors.grey;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Call _changeColor initially to set the initial state
    _changeColor();
    // Add listeners to text controllers to call _changeColor whenever text changes
    _phoneNumberController.addListener(_changeColor);
    _passwordController.addListener(_changeColor);
  }

  @override
  void dispose() {
    // Dispose text controller listeners to avoid memory leaks
    _phoneNumberController.removeListener(_changeColor);
    _passwordController.removeListener(_changeColor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Consumer<LoginProvider>(
          builder: (context, si, child) => si.isLoading
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Center(
                          child: Container(
                            child:
                                Image.asset('lib/assets/billDaddycombine.png'),
                            height: 50,
                            width: 100,
                          ),
                        ),
                        Center(
                          child: Text(
                            'Your gateway to seamless payments!',
                            style: GoogleFonts.quicksand(),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, bottom: 10),
                          child: Text(
                            'Login',
                            style: GoogleFonts.quicksand(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(1.0),
                          margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Phone Number is required';
                              }
                              return null;
                            },
                            style: GoogleFonts.quicksand(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                            cursorColor: Colors.green,
                            keyboardType: TextInputType.phone,
                            controller: _phoneNumberController,
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
                                  Text('Phone number '),
                                  Icon(
                                    Icons.star,
                                    color: Colors.red,
                                    size: 7,
                                  )
                                ],
                              ),
                              // labelText: 'Phone number',
                              labelStyle:
                                  GoogleFonts.quicksand(color: Colors.black),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: 'Enter your phone number',
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
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(1.0),
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            },
                            style: GoogleFonts.quicksand(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                            cursorColor: Colors.green,
                            controller: _passwordController,
                            obscureText: passwordObscured,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: EdgeInsets.only(
                                left: 15,
                                top: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              // labelText: 'Password',
                              label: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Password '),
                                  Icon(
                                    Icons.star,
                                    color: Colors.red,
                                    size: 7,
                                  )
                                ],
                              ),
                              labelStyle:
                                  GoogleFonts.quicksand(color: Colors.black),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              suffixIcon: IconButton(
                                onPressed: (() => setState(() {
                                      passwordObscured = !passwordObscured;
                                    })),
                                icon: Icon(
                                  passwordObscured
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: 'Enter your Password',
                              hintStyle: GoogleFonts.quicksand(
                                  color: Colors.black,
                                  fontSize: screenSize.width * 0.03),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 5, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    PageTransition(
                                      child: ForgotPasswordScreen(),
                                      type: PageTransitionType.fade,
                                    ),
                                  );
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: GoogleFonts.quicksand(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _containerTextColor == Colors.grey
                                ? null
                                : si.simulateLoginUp(
                                    _phoneNumberController.text.trim(),
                                    _passwordController.text.trim(),
                                    (message) => showTopSnackBar(
                                          snackBarPosition:
                                              SnackBarPosition.top,
                                          Overlay.of(context),
                                          CustomSnackBar.success(
                                            message: message,
                                          ),
                                        ),
                                    (message) => showTopSnackBar(
                                          snackBarPosition:
                                              SnackBarPosition.top,
                                          Overlay.of(context),
                                          CustomSnackBar.error(
                                            message: message,
                                          ),
                                        ),
                                    () => Navigator.of(context).push(
                                          PageTransition(
                                              child: BottomNavigationScreens(),
                                              type: PageTransitionType.fade,
                                              duration: Duration(seconds: 1)),
                                        ));
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
                                color: _containerColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              height: 60,
                              width: screenSize.width,
                              child: Text(
                                'Log In',
                                style: GoogleFonts.quicksand(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: _containerTextColor),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40.0),
                          child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account? ",
                                    style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        PageTransition(
                                          child: SignUpScreen(),
                                          type: PageTransitionType.fade,
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: GoogleFonts.quicksand(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
