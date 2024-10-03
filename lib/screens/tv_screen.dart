import 'package:flutter/material.dart';


import '../containers/tv_screencontainer/tv_smartcard_number_container.dart';

class TvScreen extends StatefulWidget {
  const TvScreen({super.key});

  @override
  State<TvScreen> createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TV',
          style: TextStyle(fontSize: 15),
        ),
        // actions: [
        //   GestureDetector(
        //     onTap: () {},
        //     child: Padding(
        //       padding: const EdgeInsets.all(10.0),
        //       child: Text(
        //         'History',
        //         style: TextStyle(
        //           color: Colors.blue,
        //         ),
        //       ),
        //     ),
        //   )
        // ],
      ),
      body: Column(children: [
      
        TvSmartCardContainer(),
      ]),
    );
  }
}
