import 'package:flutter/material.dart';
import 'package:spark2021app/states/circularDot_darkBlue.dart';

// This widget Holds all the background dark dots
class BackgroundDarkDots extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          CircularDarkBlueDot(top: 20, left: 220,), // TopmostDark
          CircularDarkBlueDot(top: 80, left: 20,), // secondDark
          CircularDarkBlueDot(top: 120, left: 80,), // thirdDark
          CircularDarkBlueDot(top: 250, left: 50,), // fourthDark
          CircularDarkBlueDot(top: 260, left: 290,), // fifthDark
          CircularDarkBlueDot(top: 400, left: 186,), // sixthDark
          CircularDarkBlueDot(top: 395, left: 258,), // seventhDark
          CircularDarkBlueDot(top: 490, left: 265,), // eightDark
          CircularDarkBlueDot(top: 540, left: 245,), // nineDark
          CircularDarkBlueDot(top: 600, left: 135,), // tenthDark
          CircularDarkBlueDot(top: 660, left: 225,), // eleventhDark
          CircularDarkBlueDot(top: 705, left: 0,), // twelfthDark
          CircularDarkBlueDot(top: 770, left: 80,), // thirteenDark
        ],
      ),
    );
  }
}
