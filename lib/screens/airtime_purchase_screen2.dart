import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/currency_input_formatter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../models/airtime_model.dart';
import '../providers/airtime_provider.dart';
import 'BottomNavigationScreens.dart';
import 'airtime_confirmation_screen.dart';

class AirtimePurchaseScreen2 extends StatefulWidget {
  final itemIcon;
  final String itemProvider;
  const AirtimePurchaseScreen2(
      {super.key, required this.itemIcon, required this.itemProvider});

  @override
  State<AirtimePurchaseScreen2> createState() => _AirtimePurchaseScreen2State();
}

class _AirtimePurchaseScreen2State extends State<AirtimePurchaseScreen2> {
  final _nameController = TextEditingController();

  final _phoneNumberController = TextEditingController();
  final _amountController = TextEditingController();
  final AirtimeProvider _airtimeProvider = AirtimeProvider();

  Color _containerColor = Colors.grey.shade200;
  Color _containerTextColor = Colors.grey;

  void _changeColor() {
    setState(() {
      if (_nameController.text.trim().isNotEmpty &&
          _phoneNumberController.text.trim().isNotEmpty &&
          _amountController.text.trim().isNotEmpty) {
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
    _nameController.addListener(_changeColor);
    _phoneNumberController.addListener(_changeColor);
    _amountController.addListener(_changeColor);
  }

  String selecctedAirtime = '';
  String selecctedicon = '';

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();

    _amountController.dispose();
    _nameController.removeListener(_changeColor);
    _phoneNumberController.removeListener(_changeColor);
    _amountController.removeListener(_changeColor);

    super.dispose();
  }

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return FutureBuilder<AirtimeProviderModel>(
          future: _airtimeProvider.getAirtimeProviders(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
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
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final data = snapshot.data!.data; //
              return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return Consumer<AirtimeProvider>(
                    builder: (context, value, child) => Container(
                      margin: EdgeInsets.only(top: 30),
                      // color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            splashColor: Colors.transparent,
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: '${item.icon!}',
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            onTap: () {
                              print('hellllllooooo');

                              value.selectedAirtime =
                                  item.provider!.toUpperCase();
                              print('my value ${value.selectedAirtime}');
                              value.selectedicon = item.icon!;
                              print('my icon value ${value.selectedicon}');

                              Navigator.pop(context);
                            },
                            title: Text(
                              '${item.name}',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: Radio(
                              value: item,
                              groupValue: selecctedAirtime,
                              onChanged: (value) {
                                setState(() {
                                  selecctedAirtime = value.toString();
                                });
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Divider(
                              color: Colors.grey[300],
                              endIndent: 20,
                              indent: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        );
      },
    );
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
                        'Airtime',
                        style:
                            GoogleFonts.quicksand(fontWeight: FontWeight.bold),
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
                  : Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _openBottomSheet(context);
                                  },
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        // backgroundColor: Colors.black,
                                        child: ClipOval(
                                          child: CachedNetworkImage(
                                            imageUrl: '${widget.itemIcon!}',
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          si.selectedAirtime.isEmpty
                                              ? widget.itemProvider
                                                  .toUpperCase()
                                              : si.selectedAirtime,
                                          style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: CircleAvatar(
                                          radius: 7,
                                          backgroundColor: Colors.transparent,
                                          child: Image.asset(
                                            'lib/assets/down.png',
                                            fit: BoxFit.contain,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Beneficiary',
                                          style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.green,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 7.0, left: 1),
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
                                  ),
                                )
                              ],
                            ),
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
                              style: GoogleFonts.quicksand(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                              cursorColor: Colors.green,
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
                                      Text('Name '),
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
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                    borderRadius: BorderRadius.circular(5)),
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
                                contentPadding: EdgeInsets.only(
                                  left: 15,
                                  top: 10,
                                  right: 10,
                                  bottom: 10,
                                ),
                                label: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Amount '),
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
                                hintText: 'Amount',
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
                          GestureDetector(
                            onTap: () {
                              _containerTextColor == Colors.grey
                                  ? null
                                  : Navigator.of(context).push(
                                      PageTransition(
                                          child: AirtimeConfirmationScreen(
                                            provider: widget.itemProvider,
                                            name: _nameController.text.trim(),
                                            phoneNumber: _phoneNumberController
                                                .text
                                                .trim(),
                                            amount:
                                                _amountController.text.trim(),
                                          ),
                                          type: PageTransitionType.fade,
                                          duration: Duration(seconds: 1)),
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
                                  color: _containerColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                height: 60,
                                width: screenSize.width,
                                child: Text(
                                  'Purchase',
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
                    ),
            ));
  }
}
