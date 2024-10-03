// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';

// import '../data/api_calls/jsonProvider.dart';
// import '../models/airtime_bundle_model.dart';
// import '../models/airtime_model.dart';
// import '../providers/airtime_provider.dart';
// import '../providers/contactProvider.dart';
// import '../providers/dataBundle_provider.dart';
// import '../providers/purchase_dataBundle_provider.dart';
// import '../widgets/bottom_sheet.dart';

// class PurchaseDataScreeen extends StatefulWidget {
//   const PurchaseDataScreeen({super.key});

//   @override
//   State<PurchaseDataScreeen> createState() => _PurchaseDataScreeenState();
// }

// class _PurchaseDataScreeenState extends State<PurchaseDataScreeen> {
  


//   final _username = Hive.box('username');
//   FocusNode _textFieldFocusNode = FocusNode();
//   @override
//   void initState() {
//     super.initState();
//     // Attach a listener to the FocusNode to detect focus changes
//     _textFieldFocusNode.addListener(_onFocusChange);
//   }

//   // final List items = [
//   //   'Airtel',
//   // ];
//   // //
//   // dynamic selectedValue = 'Airtel';
//   final _phoneNumberController = TextEditingController();
//   final _inputAirtimeController = TextEditingController();
//   final _amountController = TextEditingController();
//   @override
//   void dispose() {
//     // Don't forget to dispose of the FocusNode when it's no longer needed
//     _textFieldFocusNode.dispose();
//     _phoneNumberController.dispose();
//     _inputAirtimeController.dispose();
//     _amountController.dispose();
//     super.dispose();
//   }

//   // Callback function called when the focus changes
//   void _onFocusChange() async {
//     if (!_textFieldFocusNode.hasFocus &&
//         _phoneNumberController.text.isNotEmpty) {
//       await ApiProvider()
//           .VerifyMeter(selectedValue, _phoneNumberController.text.trim());
//       // The TextField has lost focus and is not empty, so we can make the POST request
//       // _makePostRequest(_smartcardNumberController.text);
//     }
//   }

//   dynamic selectedValue = 'mtn';

//   bool isSwitched = false;

//   @override
//   Widget build(BuildContext context) {
//     final userNameProvider = Provider.of<UserNameProvider>(context);
//     var contactProvider = Provider.of<ContactProvider>(context);
//     final screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Mobile Data',
//             style: TextStyle(fontSize: 15),
//           ),
//         ),
//         body: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 FutureBuilder<AirtimeProviderModel>(
//                   future: ApiProvider().getAirtimeProviders(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       final AirtimeProviderModel? data = snapshot.data;
//                       // Map<String, dynamic> data = snapshot.data!;
//                       return Padding(
//                         padding: const EdgeInsets.only(
//                           left: 20.0,
//                           top: 20,
//                           right: 20,
//                         ),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: Colors.blue,
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: DropdownButton(
//                             focusColor: Colors.green,
//                             isExpanded: true,
//                             underline: Container(),
//                             borderRadius: BorderRadius.circular(5),
//                             items: [
//                               DropdownMenuItem(
//                                 value: _username.get('airtel') ??
//                                     data!.data![4].provider,
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 8.0),
//                                       child: CircleAvatar(
//                                         backgroundColor: Colors.transparent,
//                                         radius: 10,
//                                         child: Image.asset(
//                                             'lib/assets/airtel.png'),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Text('Airtel'),
//                                   ],
//                                 ),
//                               ),
//                               DropdownMenuItem(
//                                 value: _username.get('mtn') ??
//                                     data!.data![1].provider,
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 8.0),
//                                       child: CircleAvatar(
//                                         backgroundColor: Colors.transparent,
//                                         radius: 10,
//                                         child:
//                                             Image.asset('lib/assets/mtn.png'),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Text('MTN'),
//                                   ],
//                                 ),
//                               ),
//                               DropdownMenuItem(
//                                 value: _username.get('glo') ??
//                                     data!.data![3].provider,
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 8.0),
//                                       child: CircleAvatar(
//                                         backgroundColor: Colors.transparent,
//                                         radius: 10,
//                                         child:
//                                             Image.asset('lib/assets/glo.jpeg'),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Text('GLO'),
//                                   ],
//                                 ),
//                               ),
//                               DropdownMenuItem(
//                                 value: _username.get('9mobile') ??
//                                     data!.data![2].provider,
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 8.0),
//                                       child: CircleAvatar(
//                                         backgroundColor: Colors.transparent,
//                                         radius: 10,
//                                         child: Image.asset(
//                                             'lib/assets/9mobile.png'),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Text('9Mobile'),
//                                   ],
//                                 ),
//                               ),
//                               DropdownMenuItem(
//                                 value: _username.get('smile') ??
//                                     data!.data![0].provider,
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 8.0),
//                                       child: CircleAvatar(
//                                         backgroundColor: Colors.transparent,
//                                         radius: 10,
//                                         child: Image.asset(
//                                             'lib/assets/smile_network.jpeg'),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Text('Smile'),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                             value: selectedValue,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedValue = value;
//                               });
//                             },
//                           ),
//                         ),
//                       );
//                     } else {
//                       return Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: Shimmer.fromColors(
//                           baseColor: Color.fromARGB(
//                               255, 209, 217, 231), // Color when not shimmering
//                           highlightColor:
//                               Colors.grey[100]!, // Color when shimmering
//                           period: Duration(
//                               milliseconds: 1000), // Duration of one cycle
//                           child: Container(
//                             color: Colors.white,
//                             height: 50,
//                             width: screenSize.width - 10,
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Consumer<UserNameProvider>(
//                     builder: (context, value, child) => GestureDetector(
//                       onTap: () {
//                         value.isLoading
//                             ? null
//                             : userNameProvider
//                                 .getBundleProviders(selectedValue)
//                                 .then(
//                                   (value) => showModalBottomSheet(
//                                     context: context,
//                                     builder: (_) => Consumer<UserNameProvider>(
//                                       builder: (context, ji, child) => Column(
//                                         children: [
//                                           ListTile(
//                                             title: Center(
//                                                 child: Text(
//                                               'Select a Package',
//                                               style: TextStyle(
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             )),
//                                           ),
//                                           Divider(),
//                                           Expanded(
//                                             child: ListView.builder(
//                                               itemCount: ji.userNames.length,
//                                               itemBuilder: (context, index) {
//                                                 final userName =
//                                                     ji.userNames[index];
//                                                 final dataCode =
//                                                     ji.response[index]
//                                                         ['datacode'];
//                                                 final Price =
//                                                     ji.response[index]['price'];
//                                                 final isSelected =
//                                                     ji.selectedStates[index];

//                                                 return ListTile(
//                                                   title: Center(
//                                                       child: Text(userName)),
//                                                   trailing: Radio<bool>(
//                                                     activeColor: Colors.amber,
//                                                     fillColor:
//                                                         MaterialStatePropertyAll(
//                                                             Colors.green),
//                                                     value: isSelected,
//                                                     groupValue: true,
//                                                     onChanged:
//                                                         (bool? isSelected) {
//                                                       ji.setSelectedIndex(
//                                                           index);
//                                                       if (isSelected == true) {
//                                                         print('isSelected');
//                                                         ji.setSelectedUserName(
//                                                             userName);
//                                                         Navigator.of(context)
//                                                             .pop(); // Close the bottom sheet
//                                                       } else {
//                                                         ji.setSelectedUserName(
//                                                             userName);
//                                                         ji.setSelectedDataCode(
//                                                             dataCode);
//                                                         ji.setSelectedDataPrice(
//                                                             Price);
//                                                         Navigator.of(context)
//                                                             .pop();
//                                                       }
//                                                     },
//                                                   ),
//                                                   onTap: () {
//                                                     ji.setSelectedIndex(index);
//                                                     if (isSelected == true) {
//                                                       ji.setSelectedUserName(
//                                                           userName);
//                                                       Navigator.of(context)
//                                                           .pop(); // Close the bottom sheet
//                                                     } else {
//                                                       ji.setSelectedUserName(
//                                                           userName);
//                                                       ji.setSelectedDataCode(
//                                                           dataCode);
//                                                       ji.setSelectedDataPrice(
//                                                           Price);
//                                                       Navigator.of(context)
//                                                           .pop();
//                                                     }
//                                                   },
//                                                 );
//                                               },
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                       },
//                       child: Consumer<UserNameProvider>(
//                         builder: (context, ty, child) => Container(
//                           padding: EdgeInsets.all(15),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(ty.selectedUserName.isEmpty
//                                     ? 'Tap to select a Package'
//                                     : ' ${ty.selectedUserName}'),
//                                 Container(
//                                     height: 10,
//                                     width: 10,
//                                     child: ty.isLoading
//                                         ? Container(
//                                             height: 5,
//                                             width: 5,
//                                             child: CircularProgressIndicator(),
//                                           )
//                                         : Image.asset(
//                                             'lib/assets/down-arrow.png')),
//                               ]),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.blue),
//                             color: Color.fromARGB(255, 235, 236, 240),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.only(left: 20.0, top: 0),
//                 //   child: Text('Phone Number'),
//                 // ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20.0, right: 20),
//                   child: Container(
//                     // width: screenSize.width,
//                     padding: const EdgeInsets.all(0.0),
//                     child: TextFormField(
//                       // focusNode: _textFieldFocusNode,
//                       // validator: (value) {
//                       //   if (value == null || value.isEmpty) {
//                       //     return 'Input Phone Number';
//                       //   }
//                       //   return null;
//                       // },

//                       style: TextStyle(color: Colors.black),
//                       cursorColor: Colors.blue,
//                       keyboardType: TextInputType.number,
//                       controller: _phoneNumberController,
//                       decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.blue,
//                           ),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         suffixIcon: IconButton(
//                           onPressed: () async {
//                             // await contactProvider.openContactPicker(context);
//                           },
//                           icon: Icon(
//                             Icons.person,
//                             size: 15,
//                           ),
//                         ),
//                         contentPadding: EdgeInsets.all(10),
//                         hintText: 'Enter Phone Number',
//                         hintStyle: TextStyle(
//                             color: Colors.grey,
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
//                 //   child: Text('Amount'),
//                 // ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Consumer<UserNameProvider>(
//                         builder: (context, si, child) => Container(
//                           // width: screenSize.width,
//                           padding: const EdgeInsets.all(20.0),
//                           child: TextFormField(
//                             // onChanged: (value) {
//                             //   value = '${si.selectedPrice}';
//                             // },
//                             readOnly: true,
//                             style: TextStyle(color: Colors.blue),
//                             cursorColor: Colors.blue,
//                             keyboardType: TextInputType.number,
//                             controller: _inputAirtimeController,
//                             decoration: InputDecoration(
//                               hintText: '${si.selectedPrice}',

//                               // labelText: '${si.selectedPrice}',

//                               // label: Text('${si.selectedPrice}'),
//                               floatingLabelBehavior:
//                                   FloatingLabelBehavior.never,

//                               prefixStyle: TextStyle(
//                                 fontSize: 20,
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Colors.blue,
//                                 ),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Colors.blue,
//                                 ),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               // prefixIcon: Icon(Icons.crop_square),

//                               contentPadding: EdgeInsets.all(10),
//                               // hintText: 'Email',
//                               hintStyle: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: screenSize.width * 0.03),
//                               filled: true,
//                               fillColor: Color.fromARGB(255, 235, 236, 240),
//                               border:

//                                   //  UnderlineInputBorder(),

//                                   OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.blue),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     showModalBottomSheet(
//                       context: context,
//                       builder: (context) {
//                         return Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Container(
//                             height: screenSize.height * 0.5,
//                             child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         'Comfirm Airtime Purchase',
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 30,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Container(
//                                     padding: EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                       color: Colors.grey.shade300,
//                                       borderRadius: BorderRadius.circular(20),
//                                     ),
//                                     child: Column(
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.all(10.0),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 'Product Name',
//                                                 style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   SizedBox(
//                                                     width: 10,
//                                                   ),
//                                                   Text(
//                                                     '${selectedValue}',
//                                                     style: TextStyle(
//                                                       fontSize: 20,
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.all(10.0),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 'Amount',
//                                                 style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                               ),
//                                               Consumer<UserNameProvider>(
//                                                 builder:
//                                                     (context, value, child) =>
//                                                         Text(
//                                                   '#${value.selectedPrice}',
//                                                   style: TextStyle(
//                                                     fontSize: 20,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.all(10.0),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 'Phone Number',
//                                                 style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                               ),
//                                               Text(
//                                                 _phoneNumberController.text,
//                                                 style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                         Consumer<PurchaseDataBundleProvider>(
//                                           builder: (context, cv, child) =>
//                                               Consumer<UserNameProvider>(
//                                             builder: (context, vb, child) =>
//                                                 GestureDetector(
//                                               onTap: () {
//                                                 // ApiProvider().getBundleProviders(selectedValue);
//                                                 ApiProvider()
//                                                     .getElectricityProviders();
//                                                 cv.isLoading
//                                                     ? null
//                                                     : cv.simulateDataBundlePurchase(
//                                                         amount:
//                                                             '${vb.selectedDataCode}',
//                                                         phone_no:
//                                                             _phoneNumberController
//                                                                 .text
//                                                                 .trim(),
//                                                         provider: selectedValue,
//                                                         plan:
//                                                             '${vb.selectedPrice}');
//                                               },
//                                               child: Container(
//                                                 height:
//                                                     screenSize.height * 0.06,
//                                                 width: screenSize.width,
//                                                 margin:
//                                                     const EdgeInsets.fromLTRB(
//                                                         10, 20, 10, 5),
//                                                 padding:
//                                                     const EdgeInsets.fromLTRB(
//                                                         20, 15, 20, 15),
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.blue,
//                                                   borderRadius:
//                                                       BorderRadius.circular(5),
//                                                 ),
//                                                 // height: 50,
//                                                 // margin: const EdgeInsets.fromLTRB(80, 0, 90, 0),

//                                                 child: Center(
//                                                   child: Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     children: [
//                                                       cv.isLoading
//                                                           ? Container(
//                                                               height: 5,
//                                                               width: 5,
//                                                               child:
//                                                                   CircularProgressIndicator(
//                                                                 valueColor:
//                                                                     AlwaysStoppedAnimation(
//                                                                         Colors
//                                                                             .white),
//                                                                 backgroundColor:
//                                                                     Colors
//                                                                         .black,
//                                                                 strokeWidth: 5,
//                                                                 color: Colors
//                                                                     .black,
//                                                               ),
//                                                             )
//                                                           : Text(
//                                                               cv.isLoading
//                                                                   ? ''
//                                                                   : '',
//                                                               style: TextStyle(
//                                                                   fontSize: 20,
//                                                                   color: Colors
//                                                                       .white,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .bold),
//                                                             ),
//                                                       Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .only(
//                                                                 left: 8.0),
//                                                         child: Text(
//                                                           cv.isLoading
//                                                               ? 'Please wait'
//                                                               : ' Pay',
//                                                           style: TextStyle(
//                                                               fontSize: 20,
//                                                               color:
//                                                                   Colors.white,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ]),
//                             decoration: BoxDecoration(
//                               // color: Colors.amber,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                     // Get.bottomSheet(

//                     // );
//                   },
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.only(right: 20.0, left: 20, top: 20),
//                     child: Container(
//                       height: 50,
//                       width: screenSize.width - 10,
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                           color: Colors.green,
//                           borderRadius: BorderRadius.circular(5)),
//                       child: Center(
//                         child: Text(
//                           'Pay',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ]),
//         ));
//   }
// }
