import 'package:flutter/material.dart';

import '../containers/home_container/dashboard_container.dart';
import '../containers/home_container/profile_container.dart';
import '../containers/home_container/purchasse_dashboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ProfileHomeContainer(),
          DashboardHomeDetail(),
        ],
      ),
    );
  }
}

//  Badge(
//                       isLabelVisible: true,
//                       backgroundColor: Colors.amber,
//                       label: Text('2'),
//                       child: Icon(
//                         Icons.notifications,
//                         color: Colors.black,
//                       ),
//                     ),
