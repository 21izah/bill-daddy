// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';

// import '../../data/api_calls/jsonProvider.dart';
// import '../../screens/airtime_purchase_screen.dart';
// import '../../screens/electricity_screen.dart';
// import '../../screens/purchase_data_screen.dart';
// import '../../screens/tv_screen.dart';

// class PurchaseDashboard extends StatefulWidget {
//   const PurchaseDashboard({super.key});

//   @override
//   State<PurchaseDashboard> createState() => _PurchaseDashboardState();
// }

// class _PurchaseDashboardState extends State<PurchaseDashboard> {
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 20.0,
//         right: 20,
//       ),
//       child: Container(
//         height: screenSize.height * 0.22,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () async {
//                         // await ApiProvider().getAirtimeProviders();

//                         Navigator.of(context).push(
//                           PageTransition(
//                             child: AirtimePurchaseScreen(),
//                             type: PageTransitionType.fade,
//                           ),
//                         );
//                       },
//                       child: Column(
//                         children: [
//                           GestureDetector(
//                             onTap: () async {
//                               // await ApiProvider().getAirtimeProviders();

//                               Navigator.of(context).push(
//                                 PageTransition(
//                                   child: AirtimePurchaseScreen(),
//                                   type: PageTransitionType.fade,
//                                 ),
//                               );
//                             },
//                             child: Container(
//                               height: 20,
//                               width: 20,
//                               child: Image.asset('lib/assets/wifi.png'),
//                             ),
//                           ),
//                           Text('Airtime'),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           PageTransition(
//                             child: PurchaseDataScreeen(),
//                             type: PageTransitionType.fade,
//                           ),
//                         );
//                       },
//                       child: Column(
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               ApiProvider().getBundleProviders('mtn');
//                               Navigator.of(context).push(
//                                 PageTransition(
//                                   child: PurchaseDataScreeen(),
//                                   type: PageTransitionType.fade,
//                                 ),
//                               );
//                             },
//                             child: Container(
//                               height: 20,
//                               width: 20,
//                               child: Image.asset('lib/assets/internet(1).png'),
//                             ),
//                           ),
//                           Text('Data'),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 20,
//                             width: 20,
//                             child: Image.asset('lib/assets/soccer.png'),
//                           ),
//                           Text('Betting'),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           PageTransition(
//                             child: TvScreen(),
//                             type: PageTransitionType.fade,
//                           ),
//                         );
//                       },
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 20,
//                             width: 20,
//                             child: Image.asset('lib/assets/tv.png'),
//                           ),
//                           Text('TV'),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () async {
//                         // await ApiProvider().getElectricityProviders();
//                         Navigator.of(context).push(
//                           PageTransition(
//                             child: ElectricityScreen(),
//                             type: PageTransitionType.fade,
//                           ),
//                         );
//                       },
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 20,
//                             width: 20,
//                             child: Image.asset('lib/assets/light-bulb.png'),
//                           ),
//                           Text('Electricity'),
//                         ],
//                       ),
//                     ),
//                     // Column(
//                     //   children: [
//                     //     CircleAvatar(
//                     //       child: Icon(Icons.phone_android_outlined),
//                     //     ),
//                     //     Text('Internet'),
//                     //   ],
//                     // ),
//                     // Column(
//                     //   children: [
//                     //     CircleAvatar(
//                     //       child: Icon(Icons.phone_android_outlined),
//                     //     ),
//                     //     Text('School&Exam'),
//                     //   ],
//                     // ),
//                     // Column(
//                     //   children: [
//                     //     CircleAvatar(
//                     //       child: Icon(Icons.phone_android_outlined),
//                     //     ),
//                     //     Text('More'),
//                     //   ],
//                     // ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
