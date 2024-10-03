// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:pave_day/data/api_calls/jsonProvider.dart';

// class DropDownButtonWidget extends StatefulWidget {
//   const DropDownButtonWidget({super.key});

//   @override
//   State<DropDownButtonWidget> createState() => _DropDownButtonWidgetState();
// }

// class _DropDownButtonWidgetState extends State<DropDownButtonWidget> {
//   final List items = [
//     'Airtel',
//     'MTN',
//     'GLO',
//     '9Mobile',
//   ];
//   String? selectedValue;
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return FutureBuilder<Map<String, dynamic>>(
//         future: ApiProvider().getAirtimeProviders(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             Map<String, dynamic> data = snapshot.data! as Map<String, dynamic>;
//             return DropdownButton(
//               items: [
//                 DropdownMenuItem(
//                   value: 'Airtel',
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         child: Icon(Icons.person),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text('Airtel'),
//                     ],
//                   ),
//                 ),
//                 DropdownMenuItem(
//                   value: 'MTN',
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         child: Icon(Icons.person),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text('MTN'),
//                     ],
//                   ),
//                 ),
//                 DropdownMenuItem(
//                   value: 'GLO',
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         child: Icon(Icons.person),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text('GLO'),
//                     ],
//                   ),
//                 ),
//                 DropdownMenuItem(
//                   value: '9Mobile',
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         child: Icon(Icons.person),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text('9Mobile'),
//                     ],
//                   ),
//                 ),
//               ],
//               value: selectedValue,
//               onChanged: (value) {
//                 setState(() {
//                   selectedValue = value;

//                   // if (selectedValue == 'My Profile') {
//                   //   // Navigator.of(context).push(PageTransition(
//                   //   //   child: ProfilePage(),
//                   //   //   type: PageTransitionType.rightToLeft,
//                   //   // ));
//                   // } else if (selectedValue == 'Bank Account') {
//                   //   // Navigator.of(context).push(PageTransition(
//                   //   //   child: CreatePinScreen(),
//                   //   //   type: PageTransitionType.rightToLeft,
//                   //   // ));
//                   // }
//                 });
//               },
//             );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         });
//   }
// }
