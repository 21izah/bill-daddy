import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  int selectedIndex = 1;

  bool isChecked = false;

  bool passwordObscured = true;

  final _nameController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    void openBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: screenSize.height * 0.3,
            width: screenSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 20),
                  child: Text(
                    'Change photo',
                    style: GoogleFonts.quicksand(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 20,
                    right: 20,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.green,
                            ),
                            backgroundColor: Colors.green.withOpacity(0.1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Take a photo',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text('>'),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey[400],
                  // endIndent: 20,
                  indent: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 20,
                    right: 20,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            child: Icon(
                              Icons.picture_in_picture_outlined,
                              color: Colors.green,
                            ),
                            backgroundColor: Colors.green.withOpacity(0.1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Select from gallery',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text('>'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

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
          'Profile',
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
              SizedBox(
                height: 30,
              ),
              Container(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          openBottomSheet();
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
              SizedBox(
                height: 70,
              ),
              Container(
                padding: const EdgeInsets.all(1.0),
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
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
                      label: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Name '),
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
                      hintText: 'Enter your name',
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone Number is required';
                    }
                    return null;
                  },
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
                          Text('Phone number '),
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
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(1.0),
                margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'email is required';
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
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 60,
                  width: screenSize.width,
                  child: Text(
                    'Save',
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
