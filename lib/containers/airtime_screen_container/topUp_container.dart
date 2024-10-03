// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import '../../data/api_calls/jsonProvider.dart';
// import 'package:provider/provider.dart';

// import '../../data/api_calls/jsonProvider.dart';
// import '../../models/airtime_model.dart';
// import '../../providers/airtime_provider.dart';
// import 'package:shimmer/shimmer.dart';

// class TopUpContainer extends StatefulWidget {
//   const TopUpContainer({super.key});

//   @override
//   State<TopUpContainer> createState() => _TopUpContainerState();
// }

// class _TopUpContainerState extends State<TopUpContainer> {
//   final _username = Hive.box('username');

//   bool isSwitched1 = true;
//   final List items = [
//     'airtel',
//     'mtn',
//     'glo',
//     '9mobile',
//     'smile',
//   ];
//   //
//   dynamic selectedValue = 'mtn';
//   // text controllers
//   final _inputAirtimeController = TextEditingController();
//   final _phoneNumberController = TextEditingController();
//   void dispose() {
//     _inputAirtimeController.dispose();
//     _phoneNumberController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             FutureBuilder<AirtimeProviderModel>(
//               future: ApiProvider().getAirtimeProviders(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   final AirtimeProviderModel? data = snapshot.data;
//                   // Map<String, dynamic> data = snapshot.data!;
//                   return Padding(
//                     padding: const EdgeInsets.only(
//                       left: 20.0,
//                       top: 20,
//                       right: 20,
//                     ),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.blue,
//                         ),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: DropdownButton(
//                         isExpanded: true,
//                         underline: Container(),
//                         borderRadius: BorderRadius.circular(10),
//                         items: [
//                           DropdownMenuItem(
//                             value: _username.get('airtel') ??
//                                 data!.data![4].provider,
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 8.0),
//                                   child: CircleAvatar(
//                                     backgroundColor: Colors.transparent,
//                                     radius: 10,
//                                     child: Image.asset('lib/assets/airtel.png'),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text('Airtel'),
//                               ],
//                             ),
//                           ),
//                           DropdownMenuItem(
//                             value:
//                                 _username.get('mtn') ?? data!.data![1].provider,
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 8.0),
//                                   child: CircleAvatar(
//                                     backgroundColor: Colors.transparent,
//                                     radius: 10,
//                                     child: Image.asset('lib/assets/mtn.png'),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text('MTN'),
//                               ],
//                             ),
//                           ),
//                           DropdownMenuItem(
//                             value:
//                                 _username.get('glo') ?? data!.data![3].provider,
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 8.0),
//                                   child: CircleAvatar(
//                                     backgroundColor: Colors.transparent,
//                                     radius: 10,
//                                     child: Image.asset('lib/assets/glo.jpeg'),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text('GLO'),
//                               ],
//                             ),
//                           ),
//                           DropdownMenuItem(
//                             value: _username.get('9mobile') ??
//                                 data!.data![2].provider,
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 8.0),
//                                   child: CircleAvatar(
//                                     backgroundColor: Colors.transparent,
//                                     radius: 10,
//                                     child:
//                                         Image.asset('lib/assets/9mobile.png'),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text('9Mobile'),
//                               ],
//                             ),
//                           ),
//                           DropdownMenuItem(
//                             value: _username.get('smile') ??
//                                 data!.data![0].provider,
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 8.0),
//                                   child: CircleAvatar(
//                                     backgroundColor: Colors.transparent,
//                                     radius: 10,
//                                     child: Image.asset(
//                                         'lib/assets/smile_network.jpeg'),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text('Smile'),
//                               ],
//                             ),
//                           ),
//                         ],
//                         value: selectedValue,
//                         onChanged: (value) {
//                           setState(() {
//                             selectedValue = value;
//                           });
//                         },
//                       ),
//                     ),
//                   );
//                 } else {
//                   return Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Shimmer.fromColors(
//                       baseColor: Color.fromARGB(
//                           255, 209, 217, 231), // Color when not shimmering
//                       highlightColor:
//                           Colors.grey[100]!, // Color when shimmering
//                       period:
//                           Duration(milliseconds: 1000), // Duration of one cycle
//                       child: Container(
//                         color: Colors.white,
//                         height: 50,
//                         width: screenSize.width - 10,
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//             // Padding(
//             //   padding: const EdgeInsets.only(left: 10.0, top: 20),
//             //   child: Text('Meter name'),
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
//                   // focusNode: _textFieldFocusNode,
//                   // validator: (value) {
//                   //   if (value == null || value.isEmpty) {
//                   //     return 'Input Phone Number';
//                   //   }
//                   //   return null;
//                   // },

//                   style: TextStyle(color: Colors.blue),
//                   cursorColor: Colors.blue,
//                   keyboardType: TextInputType.number,
//                   controller: _phoneNumberController,
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.blue,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.blue),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     contentPadding: EdgeInsets.all(10),
//                     hintText: 'Enter Phone Number',
//                     hintStyle: TextStyle(
//                         color: Colors.grey, fontSize: screenSize.width * 0.03),
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
//             // Padding(
//             //   padding: const EdgeInsets.only(left: 10.0, top: 20),
//             //   child: Text('Amount'),
//             // ),
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     // width: screenSize.width,
//                     padding: const EdgeInsets.all(20.0),
//                     child: TextFormField(
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Input Phone Number';
//                         }
//                         return null;
//                       },
//                       style: TextStyle(color: Colors.blue),
//                       cursorColor: Colors.blue,
//                       keyboardType: TextInputType.number,
//                       controller: _inputAirtimeController,
//                       decoration: InputDecoration(
//                         labelText: ' Input amount',
//                         hintStyle: TextStyle(
//                             color: Colors.grey,
//                             fontSize: screenSize.width * 0.03),
//                         // prefixText: '#',
//                         // prefixStyle: TextStyle(
//                         //   fontSize: 20,
//                         // ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.blue,
//                           ),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.blue,
//                           ),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         // prefixIcon: Icon(Icons.crop_square),
//                         suffixIcon: IconButton(
//                           onPressed: () {
//                             _inputAirtimeController.clear();
//                           },
//                           icon: Icon(
//                             Icons.clear,
//                             size: 15,
//                           ),
//                         ),
//                         contentPadding: EdgeInsets.all(10),

//                         filled: true,
//                         fillColor: Color.fromARGB(255, 235, 236, 240),
//                         border:

//                             //  UnderlineInputBorder(),

//                             OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
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
//                                             '#${_inputAirtimeController.text}',
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
//                                             'Phone Number',
//                                             style: TextStyle(
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                           Text(
//                                             _phoneNumberController.text,
//                                             style: TextStyle(
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     Consumer<AirtimeProvider>(
//                                       builder: (context, cv, child) =>
//                                           GestureDetector(
//                                         onTap: () {
//                                           // ApiProvider().getBundleProviders(selectedValue);
//                                           ApiProvider()
//                                               .getElectricityProviders();
//                                           cv.isLoading
//                                               ? null
//                                               : cv.simulateAirtime(
//                                                   amount:
//                                                       _inputAirtimeController
//                                                           .text
//                                                           .trim(),
//                                                   phone_no:
//                                                       _phoneNumberController
//                                                           .text
//                                                           .trim(),
//                                                   provider: selectedValue,
//                                                 );
//                                         },
//                                         child: Container(
//                                           height: screenSize.height * 0.06,
//                                           width: screenSize.width,
//                                           margin: const EdgeInsets.fromLTRB(
//                                               10, 20, 10, 5),
//                                           padding: const EdgeInsets.fromLTRB(
//                                               20, 15, 20, 15),
//                                           decoration: BoxDecoration(
//                                             color: Colors.blue,
//                                             borderRadius:
//                                                 BorderRadius.circular(5),
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
//                                                         : ' Pay',
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
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Save Beneficiary'),
//                   Container(
//                     height: screenSize.height * 0.015,
//                     child: Switch.adaptive(
//                       activeColor: Theme.of(context).colorScheme.background,
//                       activeTrackColor: Colors.deepOrange,
//                       inactiveTrackColor: Colors.deepOrange,
//                       value: isSwitched1,
//                       onChanged: (value) {
//                         setState(() {
//                           isSwitched1 = value;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ]),
//     );
//   }
// }
