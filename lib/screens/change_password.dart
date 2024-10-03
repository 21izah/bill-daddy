import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _nameController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        // leading: GestureDetector(
        //   onTap: () {
        //     Navigator.of(context).pop(
        //       PageTransition(
        //         child: WelcomeScreen(),
        //         type: PageTransitionType.leftToRight,
        //       ),
        //     );
        //   },
        //   child: Icon(Icons.arrow_back),
        // ),
        title: Text(
          'Change Password',
          style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(1.0),
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextFormField(
                  style: GoogleFonts.quicksand(color: Colors.blue),
                  cursorColor: Colors.blue,
                  keyboardType: TextInputType.text,
                  controller: _nameController,
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
                          Text('Old password '),
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
              Container(
                padding: const EdgeInsets.all(1.0),
                margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                child: TextFormField(
                  style: GoogleFonts.quicksand(color: Colors.blue),
                  cursorColor: Colors.blue,
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
                          Text('New password '),
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
              Container(
                padding: const EdgeInsets.all(1.0),
                margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                child: TextFormField(
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
                          Text('Confirm password '),
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
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 60,
                  width: screenSize.width,
                  child: Text(
                    'Change password',
                    style: GoogleFonts.quicksand(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
