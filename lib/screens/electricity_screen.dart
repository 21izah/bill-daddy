import 'package:billdaddddy/models/electricity_model.dart';
import 'package:billdaddddy/providers/electricity_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/currency_input_formatter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/airtime_bundle_model.dart';
import '../models/airtime_model.dart';
import '../providers/airtime_provider.dart';
import '../providers/cable_provider.dart';
import '../providers/data_provider.dart';
import 'data_confirmation_screen.dart';

class ElectricityScreen extends StatefulWidget {
  const ElectricityScreen({super.key});

  @override
  State<ElectricityScreen> createState() => _ElectricityScreenState();
}

class _ElectricityScreenState extends State<ElectricityScreen> {
  final AirtimeProvider _airtimeProvider = AirtimeProvider();
  final DataProvider _dataProvider = DataProvider();
  final CableProvider _cableProvider = CableProvider();
  final ElectricityProvider _electricityProvider = ElectricityProvider();
  final _planController = TextEditingController();

  final _phoneNumberController = TextEditingController();
  final _amountController = TextEditingController();
  bool isFirstcontainerShowing = true;
  void _changeContainer() {
    setState(() {
      isFirstcontainerShowing = !isFirstcontainerShowing;
    });
  }

  Color _containerColor = Colors.grey.shade200;
  Color _containerTextColor = Colors.grey;

  void _changeColor() {
    if (_planController.text.trim().isNotEmpty &&
        _phoneNumberController.text.trim().isNotEmpty &&
        _amountController.text.trim().isNotEmpty) {
      _containerColor = Colors.green;
      _containerTextColor = Colors.white;
    } else {
      _containerColor = Colors.grey.shade200;
      _containerTextColor = Colors.grey;
    }
  }

  @override
  void initState() {
    super.initState();
    // Call _changeColor initially to set the initial state
    _changeColor();
    // Add listeners to text controllers to call _changeColor whenever text changes
    _planController.addListener(_changeColor);
    _phoneNumberController.addListener(_changeColor);
    _amountController.addListener(_changeColor);
  }

  String selecctedAirtime = '';
  String selecctedicon = '';

  @override
  void dispose() {
    _planController.dispose();
    _phoneNumberController.dispose();

    _amountController.dispose();
    _planController.removeListener(_changeColor);
    _phoneNumberController.removeListener(_changeColor);
    _amountController.removeListener(_changeColor);

    print('dispose called');
    super.dispose();
  }

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (context) {
        return FutureBuilder<ElectricityModel>(
          future: _electricityProvider.getElectricityProviders(),
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
                  return Consumer<ElectricityProvider>(
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
                              value.selectedElectricity =
                                  item.provider!.toUpperCase();
                              print('my value ${value.selectedElectricity}');
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

  void _openPLanBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (context) {
        return Consumer<AirtimeProvider>(
          builder: (context, value, child) => FutureBuilder<AirtimeBundleModel>(
            future: _dataProvider
                .getBundleProviders('${value.selectedAirtime.toLowerCase()}'),
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
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          top: 40,
                          left: 20,
                        ),
                        height: 40,
                        child: Text(
                          'Data Plan',
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        )),
                    Expanded(
                      child: ListView.builder(
                        itemCount: data!.length,
                        itemBuilder: (context, index) {
                          final item = data[index];
                          return Consumer<DataProvider>(
                            builder: (context, value, child) => Container(
                              margin: EdgeInsets.only(top: 5),
                              // color: Colors.amber,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ListTile(
                                    splashColor: Colors.transparent,
                                    // leading: Text('${item.price}'),
                                    onTap: () {
                                      print('hellllllooooo');
                                      value.selectedPlann(item.name!);
                                      value.selectedPricee(
                                          item.price!.toString());

                                      value.selectedPlan = item.name!;
                                      value.selectedPrice =
                                          item.price!.toString();

                                      Navigator.pop(context);
                                    },
                                    title: Text(
                                      '${item.name}',
                                      style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '#${item.price}',
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
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Consumer<ElectricityProvider>(
      builder: (context, si, child) => WillPopScope(
        onWillPop: () async {
          context.read<DataProvider>().resetTexts();
          return true;
          // return true; // Allow the back button press
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: si.isLoading
                ? null
                : AppBar(
                    title: Text(
                      'Electricity',
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
                : isFirstcontainerShowing
                    ? FutureBuilder<ElectricityModel>(
                        future: _electricityProvider.getElectricityProviders(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                            print('Error: ${snapshot.error}');
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else {
                            final data = snapshot
                                .data!.data; // Accessing the list of data items
                            print('my ass ${data!}');

                            return ListView.builder(
                              itemCount: data!.length,
                              itemBuilder: (context, index) {
                                final item = data[index];
                                print('my ass item ${item!}');

                                return Container(
                                  margin: EdgeInsets.all(5),
                                  // color: Colors.green,
                                  child: Column(
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
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          print(
                                              '${item.provider!.toUpperCase()}');
                                          si.selectedElectricity =
                                              item.name!.toUpperCase();
                                          // Find the index of the first space character
                                          int spaceIndex = si
                                              .selectedElectricity
                                              .indexOf(' - ');
                                          String ElectricityPlan = si
                                              .selectedElectricity
                                              .substring(0, spaceIndex);

                                          si.selectedElectricity =
                                              ElectricityPlan;

                                          si.selectedicon = item.icon!;
                                          print(
                                              'my icon value ${si.selectedicon}');
                                          _changeContainer();
                                          _dataProvider.selectedPlan =
                                              'Select Plan';
                                          _dataProvider.selectedPrice =
                                              'Amount';
                                        },
                                        title: Text(
                                          '${item!.name}',
                                          style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        trailing: CircleAvatar(
                                          radius: 10,
                                          backgroundColor: Colors.transparent,
                                          child: Image.asset(
                                            'lib/assets/next.png',
                                            color: Colors.black,

                                            // fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Divider(
                                          color: Colors.grey[300],
                                          endIndent: 20,
                                          indent: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                        },
                      )
                    : Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                imageUrl: '${si.selectedicon!}',
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
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Container(
                                              width: 150,
                                              child: Text(
                                                si.selectedElectricity,
                                                style: GoogleFonts.quicksand(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: CircleAvatar(
                                              radius: 7,
                                              backgroundColor:
                                                  Colors.transparent,
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
                                                backgroundColor:
                                                    Colors.transparent,
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
                                margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                                child: TextFormField(
                                  style: GoogleFonts.quicksand(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
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
                                        Text('Smart card number '),
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
                                    hintText: 'Smart card number',
                                    hintStyle: GoogleFonts.quicksand(
                                        color: Colors.black,
                                        fontSize: screenSize.width * 0.03),
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
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                              ),
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
                                  keyboardType: TextInputType.text,
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
                                        Text('Smart card name '),
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
                                    hintText: 'Smart card name',
                                    hintStyle: GoogleFonts.quicksand(
                                        color: Colors.black,
                                        fontSize: screenSize.width * 0.03),
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
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                              ),
                              Consumer<DataProvider>(
                                builder: (context, value, child) => Container(
                                  padding: const EdgeInsets.all(1.0),
                                  margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                  child: TextFormField(
                                    onTap: () {
                                      _openPLanBottomSheet(context);
                                    },
                                    readOnly: true,
                                    style: GoogleFonts.quicksand(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                    cursorColor: Colors.green,
                                    keyboardType: TextInputType.text,
                                    controller: value.planController,
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
                                            Text('Package '),
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
                                        suffixIcon: Icon(
                                            Icons.keyboard_arrow_down_outlined),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        hintText: value.selectedPlan.isEmpty
                                            ? 'Select plan'
                                            : _planController.text =
                                                value.selectedPlan,
                                        hintStyle: GoogleFonts.quicksand(
                                            color: Colors.black,
                                            fontSize: screenSize.width * 0.03),
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                  ),
                                ),
                              ),
                              Consumer<DataProvider>(
                                builder: (context, value, child) => Container(
                                  padding: const EdgeInsets.all(1.0),
                                  margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                  child: TextFormField(
                                    onTap: () {
                                      _openPLanBottomSheet(context);
                                    },
                                    readOnly: true,
                                    style: GoogleFonts.quicksand(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                    cursorColor: Colors.green,
                                    keyboardType: TextInputType.text,
                                    controller: value.planController,
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
                                            Text('Months of subscription '),
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
                                        suffixIcon: Icon(
                                            Icons.keyboard_arrow_down_outlined),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        hintText: value.selectedPlan.isEmpty
                                            ? 'Select plan'
                                            : _planController.text =
                                                value.selectedPlan,
                                        hintStyle: GoogleFonts.quicksand(
                                            color: Colors.black,
                                            fontSize: screenSize.width * 0.03),
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                  ),
                                ),
                              ),
                              Consumer<DataProvider>(
                                builder: (context, value, child) => Container(
                                  padding: const EdgeInsets.all(1.0),
                                  margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                  child: TextFormField(
                                    readOnly: true,
                                    inputFormatters: [
                                      CurrencyInputFormatter(
                                        leadingSymbol: '#',
                                        mantissaLength: 0,
                                      )
                                    ],
                                    style: GoogleFonts.quicksand(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                    keyboardType: TextInputType.number,
                                    cursorColor: Colors.green,
                                    controller: value.amountController,
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
                                      labelStyle: GoogleFonts.quicksand(
                                          color: Colors.black),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      hintText: value.selectedPrice.isEmpty
                                          ? 'Amount'
                                          : _amountController.text =
                                              value.selectedPrice,
                                      hintStyle: GoogleFonts.quicksand(
                                          color: Colors.black,
                                          fontSize: screenSize.width * 0.03),
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
                                              BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                              ),
                              Consumer<DataProvider>(
                                builder: (context, value, child) =>
                                    GestureDetector(
                                  onTap: () {
                                    _containerTextColor == Colors.grey
                                        ? null
                                        : Navigator.of(context).push(
                                            PageTransition(
                                                child: DataConfirmationScreen(
                                                  provider:
                                                      si.selectedElectricity,
                                                  dataPlan: _planController.text
                                                      .trim(),
                                                  phoneNumber:
                                                      _phoneNumberController
                                                          .text
                                                          .trim(),
                                                  amount: _amountController.text
                                                      .trim(),
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
                              ),
                            ],
                          ),
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
