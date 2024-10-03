// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';

// import '../../data/api_calls/jsonProvider.dart';
// import '../../models/electricity_model.dart';
// import '../../providers/electricity_provider.dart';
// import '../../providers/verifyMeter_provider.dart';
// import '../../widgets/drop_down_button2 copy.dart';

// class MeterNumberContainer extends StatefulWidget {
//   const MeterNumberContainer({super.key});

//   @override
//   State<MeterNumberContainer> createState() => _MeterNumberContainerState();
// }

// class _MeterNumberContainerState extends State<MeterNumberContainer> {
//   final _username = Hive.box('username');
//   // Create a FocusNode to track the focus state of the TextField
//   FocusNode _textFieldFocusNode = FocusNode();
//   @override
//   void initState() {
//     super.initState();
//     // Attach a listener to the FocusNode to detect focus changes
//     _textFieldFocusNode.addListener(_onFocusChange);
//   }

//   bool isSwitched1 = true;
//   final List items = [
//     "abuja electric postpaid",
//     "abuja electric prepaid",
//     "eko electric postpaid",
//     "eko electric prepaid",
//     "enugu electric postpaid",
//     "enugu electric prepaid",
//     "ibadan electric postpaid",
//     "ibadan electric prepaid",
//     "ikeja electric postpaid",
//     "ikeja electric prepaid",
//     "jos electric postpaid",
//     "jos electric prepaid",
//     "kaduna electric prepaid",
//     "kedco electric postpaid",
//     "kedco electric prepaid",
//     "portharcourt electric postpaid",
//     "portharcourt electric prepaid",
//   ];

//   dynamic selectedValue = "ikeja electric prepaid";
//   // final List items = [
//   //   'Airtel',
//   // ];
//   // //
//   // dynamic selectedValue = 'Airtel';
//   final _meterNumberController = TextEditingController();
//   final _meterNameController = TextEditingController();
//   final _amountController = TextEditingController();
//   @override
//   void dispose() {
//     // Don't forget to dispose of the FocusNode when it's no longer needed
//     _textFieldFocusNode.dispose();
//     _meterNumberController.dispose();
//     _meterNameController.dispose();
//     _amountController.dispose();
//     super.dispose();
//   }

//   // Callback function called when the focus changes
//   void _onFocusChange() async {
//     final _VerifyMeterProvider =
//         Provider.of<VerifyMeterProvider>(context, listen: false);

//     if (!_textFieldFocusNode.hasFocus &&
//         _meterNumberController.text.isNotEmpty) {
//       await _VerifyMeterProvider.SimulateVerifyMeter(
//           selectedValue, _meterNumberController.text.trim());

//       // ApiProvider()
//       //     .VerifyMeter(selectedValue, _meterNumberController.text.trim());
//       // The TextField has lost focus and is not empty, so we can make the POST request
//       // _makePostRequest(_smartcardNumberController.text);
//     }
//   }

//   bool isSwitched = true;
//   @override
//   Widget build(BuildContext context) {
//     final _ElectricityProvider = Provider.of<ElectricityProvider>(context);
//     final _VerifyMeterProvider =
//         Provider.of<VerifyMeterProvider>(context, listen: false);
//     final screenSize = MediaQuery.of(context).size;
//     return Container(
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Text('Select Provider'),
//                       FutureBuilder<ElecticityModel>(
//                           future: ApiProvider().getElectricityProviders(),
//                           builder: (context, snapshot) {
//                             if (snapshot.hasData) {
//                               final ElecticityModel? data = snapshot.data;

//                               return Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 10.0, right: 10),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                       color: Colors.blue,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: DropdownButton(
//                                     isExpanded: true,
//                                     underline: Container(),
//                                     borderRadius: BorderRadius.circular(5),
//                                     items: [
//                                       DropdownMenuItem(
//                                         value: _username.get(
//                                                 "abuja electric postpaid") ??
//                                             data!.data[0].provider,
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 8.0),
//                                               child: CircleAvatar(
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 radius: 10,
//                                                 child: Image.asset(
//                                                     'lib/assets/airtel.png'),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text('Abuja Electric Postpaid'),
//                                           ],
//                                         ),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: _username.get(
//                                                 "abuja electric prepaid") ??
//                                             data!.data[1].provider,
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 8.0),
//                                               child: CircleAvatar(
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 radius: 10,
//                                                 child: Image.asset(
//                                                     'lib/assets/mtn.png'),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text('Abuja Electric Prepaid'),
//                                           ],
//                                         ),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: _username.get(
//                                               "eko electric postpaid",
//                                             ) ??
//                                             data!.data[2].provider,
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 8.0),
//                                               child: CircleAvatar(
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 radius: 10,
//                                                 child: Image.asset(
//                                                     'lib/assets/glo.jpeg'),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text('Eko Electric Postpaid'),
//                                           ],
//                                         ),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: _username
//                                                 .get("eko electric prepaid") ??
//                                             data!.data[3].provider,
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 8.0),
//                                               child: CircleAvatar(
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 radius: 10,
//                                                 child: Image.asset(
//                                                     'lib/assets/9mobile.png'),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text("Eko Electric Prepaid"),
//                                           ],
//                                         ),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: _username.get(
//                                                 "enugu electric postpaid") ??
//                                             data!.data[4].provider,
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 8.0),
//                                               child: CircleAvatar(
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 radius: 10,
//                                                 child: Image.asset(
//                                                     'lib/assets/smile_network.jpeg'),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text("Enugu Electric Postpaid"),
//                                           ],
//                                         ),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: _username.get(
//                                                 "enugu electric prepaid") ??
//                                             data!.data[5].provider,
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 8.0),
//                                               child: CircleAvatar(
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 radius: 10,
//                                                 child: Image.asset(
//                                                     'lib/assets/smile_network.jpeg'),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text("Enugu Electric Prepaid"),
//                                           ],
//                                         ),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: _username.get(
//                                                 "ibadan electric postpaid") ??
//                                             data!.data[6].provider,
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 8.0),
//                                               child: CircleAvatar(
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 radius: 10,
//                                                 child: Image.asset(
//                                                     'lib/assets/smile_network.jpeg'),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text("Ibadan Electric Postpaid"),
//                                           ],
//                                         ),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: _username.get(
//                                                 "ibadan electric prepaid") ??
//                                             data!.data[7].provider,
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 8.0),
//                                               child: CircleAvatar(
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 radius: 10,
//                                                 child: Image.asset(
//                                                     'lib/assets/smile_network.jpeg'),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text("Ibadan Electric Prepaid"),
//                                           ],
//                                         ),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: _username.get(
//                                                 "ikeja electric postpaid") ??
//                                             data!.data[8].provider,
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 8.0),
//                                               child: CircleAvatar(
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 radius: 10,
//                                                 child: Image.asset(
//                                                     'lib/assets/smile_network.jpeg'),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text("Ikeja Electric Postpaid"),
//                                           ],
//                                         ),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: _username.get(
//                                                 "ikeja electric prepaid") ??
//                                             data!.data[9].provider,
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 8.0),
//                                               child: CircleAvatar(
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 radius: 10,
//                                                 child: Image.asset(
//                                                     'lib/assets/smile_network.jpeg'),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text("Ikeja Electric Prepaid"),
//                                           ],
//                                         ),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: _username
//                                                 .get("jos electric postpaid") ??
//                                             data!.data[10].provider,
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 8.0),
//                                               child: CircleAvatar(
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 radius: 10,
//                                                 child: Image.asset(
//                                                     'lib/assets/smile_network.jpeg'),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text("Jos Electric Postpaid"),
//                                           ],
//                                         ),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: _username
//                                                 .get("jos electric prepaid") ??
//                                             data!.data[11].provider,
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 8.0),
//                                               child: CircleAvatar(
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 radius: 10,
//                                                 child: Image.asset(
//                                                     'lib/assets/smile_network.jpeg'),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text("Jos Electric Prepaid"),
//                                           ],
//                                         ),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: _username.get(
//                                                 "kaduna electric prepaid") ??
//                                             data!.data[12].provider,
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 8.0),
//                                               child: CircleAvatar(
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 radius: 10,
//                                                 child: Image.asset(
//                                                     'lib/assets/smile_network.jpeg'),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text("Kaduna Electric Prepaid"),
//                                           ],
//                                         ),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: _username.get(
//                                                 "kedco electric postpaid") ??
//                                             data!.data[13].provider,
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 8.0),
//                                               child: CircleAvatar(
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 radius: 10,
//                                                 child: Image.asset(
//                                                     'lib/assets/smile_network.jpeg'),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text("Kedco Electric Postpaid"),
//                                           ],
//                                         ),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: _username.get(
//                                                 "kedco electric prepaid") ??
//                                             data!.data[14].provider,
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 8.0),
//                                               child: CircleAvatar(
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 radius: 10,
//                                                 child: Image.asset(
//                                                     'lib/assets/smile_network.jpeg'),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text("Kedco Electric Prepaid"),
//                                           ],
//                                         ),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: _username.get(
//                                                 "portharcourt electric postpaid") ??
//                                             data!.data[15].provider,
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 8.0),
//                                               child: CircleAvatar(
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 radius: 10,
//                                                 child: Image.asset(
//                                                     'lib/assets/smile_network.jpeg'),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text(
//                                                 "Portharcourt Electric Postpaid"),
//                                           ],
//                                         ),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: _username.get(
//                                                 "portharcourt electric prepaid") ??
//                                             data!.data[16].provider,
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 8.0),
//                                               child: CircleAvatar(
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 radius: 10,
//                                                 child: Image.asset(
//                                                     'lib/assets/smile_network.jpeg'),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text(
//                                                 "Portharcourt Electric Prepaid"),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                     value: selectedValue,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         selectedValue = value;
//                                       });
//                                     },
//                                   ),
//                                 ),
//                               );
//                             } else {
//                               return Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 0.0, right: 0),
//                                 child: Shimmer.fromColors(
//                                   baseColor: Color.fromARGB(255, 209, 217,
//                                       231), // Color when not shimmering
//                                   highlightColor: Colors
//                                       .grey[100]!, // Color when shimmering
//                                   period: Duration(
//                                       milliseconds:
//                                           1000), // Duration of one cycle
//                                   child: Container(
//                                     color: Colors.white,
//                                     height: 50,
//                                     width: screenSize.width - 10,
//                                   ),
//                                 ),
//                               );
//                             }
//                           }),
//                     ]),
//               ),
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 5.0, right: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(''),
//                       Row(
//                         children: [
//                           Text('Beneficiaries'),
//                           Icon(
//                             Icons.arrow_right,
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(left: 20.0, right: 20, top: 10),
//                   child: Container(
//                     // width: screenSize.width,
//                     padding: const EdgeInsets.all(0.0),
//                     child: TextFormField(
//                       onChanged: (value) {
//                         if (value.length == 11) {
//                           ApiProvider().VerifyMeter(
//                             selectedValue,
//                             _meterNumberController.text.trim(),
//                           );
//                         }
//                       },
//                       focusNode: _textFieldFocusNode,
//                       validator: (value) {
//                         if (value == null ||
//                             value.isEmpty ||
//                             value.length != 11) {
//                           return 'Input a valid meter number';
//                         }
//                         return null;
//                       },
//                       style: TextStyle(color: Colors.blue),
//                       cursorColor: Colors.blue,
//                       keyboardType: TextInputType.number,
//                       controller: _meterNumberController,
//                       decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.blue,
//                           ),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         contentPadding: EdgeInsets.all(10),
//                         hintText: 'Enter Meter Number',
//                         hintStyle: TextStyle(
//                             color: Colors.black,
//                             fontSize: screenSize.width * 0.03),
//                         filled: true,
//                         fillColor: Color.fromARGB(255, 235, 236, 240),
//                         border:

//                             //  UnderlineInputBorder()
//                             OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.only(left: 10.0, top: 20),
//                 //   child: Text('Meter name'),
//                 // ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 20.0,
//                     right: 20,
//                     top: 20,
//                   ),
//                   child: Consumer<VerifyMeterProvider>(
//                     builder: (context, value, child) => value.isLoading
//                         ? Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Shimmer.fromColors(
//                               baseColor: Color.fromARGB(255, 209, 217,
//                                   231), // Color when not shimmering
//                               highlightColor:
//                                   Colors.grey[100]!, // Color when shimmering
//                               period: Duration(
//                                   milliseconds: 1000), // Duration of one cycle
//                               child: Container(
//                                 color: Colors.white,
//                                 height: 50,
//                                 width: screenSize.width - 10,
//                               ),
//                             ),
//                           )
//                         : Container(
//                             // width: screenSize.width,
//                             padding: const EdgeInsets.all(0.0),
//                             child: TextFormField(
//                               readOnly: true,
//                               style: TextStyle(color: Colors.blue),
//                               cursorColor: Colors.blue,
//                               keyboardType: TextInputType.number,
//                               controller: _meterNameController,
//                               decoration: InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colors.blue,
//                                   ),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.black),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 contentPadding: EdgeInsets.all(10),
//                                 hintText: value.meterName ?? '',
//                                 hintStyle: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: screenSize.width * 0.03),
//                                 filled: true,
//                                 fillColor: Color.fromARGB(255, 235, 236, 240),
//                                 border:

//                                     //  UnderlineInputBorder()
//                                     OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.black),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                             ),
//                           ),
//                   ),
//                 ),
//               ],
//             ),
//             // Padding(
//             //   padding: const EdgeInsets.only(left: 10.0, top: 20),
//             //   child: Text('Package'),
//             // ),
//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 20.0,
//                 right: 20,
//                 top: 20,
//               ),
//               child: Container(
//                 // width: screenSize.width,
//                 padding: const EdgeInsets.all(0.0),
//                 child: TextFormField(
//                   // validator: (value) {
//                   //   if (value == null || value.isEmpty) {
//                   //     return 'Input Phone Number';
//                   //   }
//                   //   return null;
//                   // },
//                   style: TextStyle(color: Colors.blue),
//                   cursorColor: Colors.blue,
//                   keyboardType: TextInputType.number,
//                   controller: _amountController,
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.blue,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     // suffixIcon: IconButton(
//                     //   onPressed: () {
//                     //     _smartcardNumberController.clear();
//                     //   },
//                     //   icon: Icon(
//                     //     Icons.clear,
//                     //     size: 15,
//                     //   ),
//                     // ),
//                     contentPadding: EdgeInsets.all(10),
//                     hintText: 'Enter Amount',
//                     hintStyle: TextStyle(
//                         color: Colors.black, fontSize: screenSize.width * 0.03),
//                     filled: true,
//                     fillColor: Color.fromARGB(255, 235, 236, 240),
//                     border:

//                         //  UnderlineInputBorder()
//                         OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             GestureDetector(
//               onTap: () {
//                 showModalBottomSheet(
//                   context: context,
//                   builder: (context) {
//                     return Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Container(
//                         height: screenSize.height * 0.5,
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     'Comfirm Airtime Purchase',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 30,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Container(
//                                 padding: EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey.shade300,
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(10.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             'Product Name',
//                                             style: TextStyle(
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                           Row(
//                                             children: [
//                                               // CircleAvatar(
//                                               //   backgroundColor: Colors.transparent,
//                                               //   radius: 10,
//                                               //   child: Image.asset('lib/assets/mtn.png'),
//                                               // ),
//                                               SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Text(
//                                                 '${selectedValue}',
//                                                 style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                               ),
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.all(10.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             'Amount',
//                                             style: TextStyle(
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                           Text(
//                                             '#${_amountController.text}',
//                                             style: TextStyle(
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.all(10.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             'Meter Name',
//                                             style: TextStyle(
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                           Consumer<VerifyMeterProvider>(
//                                             builder: (context, value, child) =>
//                                                 Text(
//                                               '${value.meterName}',
//                                               style: TextStyle(
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.w500,
//                                               ),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     Consumer<ElectricityProvider>(
//                                       builder: (context, cv, child) =>
//                                           GestureDetector(
//                                         onTap: () {
//                                           // ApiProvider().getBundleProviders(selectedValue);
//                                           // _ElectricityProvider.simulateElectricity(
//                                           //     provider: selectedValue,
//                                           //     meter_number: _meterNumberController.text.trim(),
//                                           //     amount: int.parse(_amountController.text.trim()));
//                                           // ApiProvider().getElectricityProviders();
//                                           cv.isLoading
//                                               ? null
//                                               : cv.simulateElectricity(
//                                                   provider: selectedValue,
//                                                   meter_number:
//                                                       _meterNumberController
//                                                           .text
//                                                           .trim(),
//                                                   amount: int.parse(
//                                                       _amountController.text
//                                                           .trim()),
//                                                 );
//                                         },
//                                         child: Container(
//                                           height: screenSize.height * 0.06,
//                                           width: screenSize.width,
//                                           margin: const EdgeInsets.fromLTRB(
//                                               20, 5, 20, 5),
//                                           padding: const EdgeInsets.fromLTRB(
//                                               20, 15, 20, 15),
//                                           decoration: BoxDecoration(
//                                             color: Colors.blue,
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           // height: 50,
//                                           // margin: const EdgeInsets.fromLTRB(80, 0, 90, 0),

//                                           child: Center(
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 cv.isLoading
//                                                     ? Container(
//                                                         height: 10,
//                                                         width: 10,
//                                                         child:
//                                                             CircularProgressIndicator(
//                                                           valueColor:
//                                                               AlwaysStoppedAnimation(
//                                                                   Colors.white),
//                                                           backgroundColor:
//                                                               Colors.black,
//                                                           strokeWidth: 5,
//                                                           color: Colors.black,
//                                                         ),
//                                                       )
//                                                     : Text(
//                                                         cv.isLoading ? '' : '',
//                                                         style: TextStyle(
//                                                             fontSize: 20,
//                                                             color: Colors.white,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .bold),
//                                                       ),
//                                                 Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           left: 8.0),
//                                                   child: Text(
//                                                     cv.isLoading
//                                                         ? 'Please wait'
//                                                         : ' Comfirm',
//                                                     style: TextStyle(
//                                                         fontSize: 20,
//                                                         color: Colors.white,
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ]),
//                         decoration: BoxDecoration(
//                           // color: Colors.amber,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 20.0, left: 20, top: 20),
//                 child: Container(
//                   height: 50,
//                   width: screenSize.width - 10,
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                       color: Colors.green,
//                       borderRadius: BorderRadius.circular(5)),
//                   child: Center(
//                     child: Text(
//                       'Pay',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             // Container(
//             //   margin: EdgeInsets.only(top: 10),
//             //   height: 100,
//             //   width: screenSize.width - 10,
//             //   decoration: BoxDecoration(
//             //     borderRadius: BorderRadius.circular(10),
//             //     color: Colors.amber,
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
