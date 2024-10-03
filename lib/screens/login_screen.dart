// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
// import 'login_screen.dart';
// import 'sign_up_screen.dart';
// import 'package:provider/provider.dart';

// import '../providers/login_provider.dart';
// import '../providers/sign_up_provider.dart';
// import 'forgot_password_screen.dart';


// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
 
//   final _phoneNumberController = TextEditingController();

//   final _passwordController = TextEditingController();

//   bool passwordObscured = true;

//   @override
//   void dispose() {
//     _phoneNumberController.dispose();

//     _passwordController.dispose();

//     super.dispose();
//   }

//   final LoginProvider _loginProvider = LoginProvider();

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: SingleChildScrollView(
//         child: Stack(children: [
//           Column(
//             children: [
//               Container(
//                 height: screenSize.height * 0.25,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.only(
//                       // bottomRight: Radius.circular(70),
//                       ),
//                 ),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Center(
//                         child: Container(
//                           margin: EdgeInsets.only(
//                             top: screenSize.height * 0.020,
//                           ),
//                           child: Text(
//                             'Welcome',
//                             style: TextStyle(fontSize: 50, color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ]),
//               ),
//               Container(
//                 height: screenSize.height * 0.75,
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).colorScheme.background,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(40),
//                     topRight: Radius.circular(40),
//                   ),
//                 ),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: screenSize.height * 0.04,
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.all(1.0),
//                         margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
//                         child: TextFormField(
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Phone Number is required';
//                             }
//                             return null;
//                           },
//                           style: TextStyle(color: Colors.blue),
//                           cursorColor: Colors.blue,
//                           keyboardType: TextInputType.number,
//                           controller: _phoneNumberController,
//                           decoration: InputDecoration(
//                               contentPadding: EdgeInsets.all(20),
//                               hintText: 'Enter your phone number',
//                               hintStyle: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: screenSize.width * 0.03),
//                               filled: true,
//                               fillColor: Colors.grey[200],
//                               border: OutlineInputBorder(
//                                   borderSide: BorderSide.none,
//                                   borderRadius: BorderRadius.circular(5))),
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.all(1.0),
//                         margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
//                         child: TextFormField(
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Password is required';
//                             }
//                             return null;
//                           },
//                           style: TextStyle(color: Colors.blue),
//                           cursorColor: Colors.blue,
//                           controller: _passwordController,
//                           obscureText: passwordObscured,
//                           decoration: InputDecoration(
//                               contentPadding: EdgeInsets.all(20),
//                               suffixIcon: IconButton(
//                                 onPressed: (() => setState(() {
//                                       passwordObscured = !passwordObscured;
//                                     })),
//                                 icon: Icon(
//                                   passwordObscured
//                                       ? Icons.visibility_off
//                                       : Icons.visibility,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                               hintText: 'Choose Password',
//                               hintStyle: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: screenSize.width * 0.03),
//                               filled: true,
//                               fillColor: Colors.grey[200],
//                               border: OutlineInputBorder(
//                                   borderSide: BorderSide.none,
//                                   borderRadius: BorderRadius.circular(5))),
//                         ),
//                       ),

//                       Consumer<LoginProvider>(
//                         builder: (context, cv, child) => GestureDetector(
//                           onTap: () {
//                             if (_formKey.currentState!.validate()) {
//                               // _login();
//                               cv.isLoading
//                                   ? null
//                                   : cv.simulateLoginUp(
//                                       phoneNumber: _phoneNumberController.text.trim(),
//                                       password: _passwordController.text.trim(),
//                                     );
//                             }
//                           },
//                           child: Container(
//                             height: screenSize.height * 0.06,
//                             margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
//                             padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//                             decoration: BoxDecoration(
//                               color: Colors.blue,
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             // height: 50,
//                             // margin: const EdgeInsets.fromLTRB(80, 0, 90, 0),

//                             child: Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   cv.isLoading
//                                       ? Container(
//                                           height: 10,
//                                           width: 10,
//                                           child: CircularProgressIndicator(
//                                             valueColor: AlwaysStoppedAnimation(
//                                                 Colors.white),
//                                             backgroundColor: Colors.black,
//                                             strokeWidth: 5,
//                                             color: Colors.black,
//                                           ),
//                                         )
//                                       : Text(
//                                           cv.isLoading ? '' : '',
//                                           style: TextStyle(
//                                               fontSize: 20,
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 8.0),
//                                     child: Text(
//                                       cv.isLoading ? 'Please wait' : 'SIGN IN',
//                                       style: TextStyle(
//                                           fontSize: 20,
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             left: 20.0, top: 5, right: 20),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Text("Don't have an Account!  "),
//                                 GestureDetector(
//                                   onTap: () {
//                                     Navigator.of(context).pushReplacement(
//                                       PageTransition(
//                                         child: SignUpScreen(),
//                                         type: PageTransitionType.fade,
//                                       ),
//                                     );
//                                   },
//                                   child: Text(
//                                     "Register",
//                                     style: TextStyle(
//                                       color: Colors.blue,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.of(context).push(
//                                   PageTransition(
//                                     child: ForgotPasswordScreen(),
//                                     type: PageTransitionType.fade,
//                                   ),
//                                 );
//                               },
//                               child: Text(
//                                 "Forgot Password?",
//                                 style: TextStyle(
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       // const SizedBox(
//                       //   height: 50,
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ]),
//       ),
//     );
//   }
// }
