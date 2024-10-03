import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/airtime_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();

    print('dispose called');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Consumer<AirtimeProvider>(
      builder: (context, si, child) => Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: si.isLoading
            ? null
            : AppBar(
                title: Text(
                  'Retrieve Token',
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
                    padding: const EdgeInsets.all(1.0),
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                    child: TextFormField(
                      style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                      cursorColor: Colors.green,
                      keyboardType: TextInputType.phone,
                      controller: _searchController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          size: 15,
                        ),
                        contentPadding: EdgeInsets.only(
                          left: 15,
                          top: 10,
                          right: 10,
                          bottom: 10,
                        ),

                        // labelText: 'Phone number',
                        labelStyle: GoogleFonts.quicksand(color: Colors.black),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Enter your meter number',
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
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
