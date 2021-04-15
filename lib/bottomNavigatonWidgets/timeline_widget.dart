import 'package:flutter/material.dart';
import 'package:spark2021app/constant.dart';

class TimeLineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: screenHeight * 0.8,
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                border: Border.all(color: kLightBlueColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
