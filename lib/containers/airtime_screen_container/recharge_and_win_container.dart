import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class RechargeAndWinContainer extends StatefulWidget {
  const RechargeAndWinContainer({super.key});

  @override
  State<RechargeAndWinContainer> createState() =>
      _RechargeAndWinContainerState();
}

class _RechargeAndWinContainerState extends State<RechargeAndWinContainer> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: 5.0,
        right: 5,
        // top: 5,
        bottom: 5,
      ),
      child: Container(
        height: screenSize.height * 0.13,
        width: screenSize.width - 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blue,
        ),
       
      ),
    );
  }
}
