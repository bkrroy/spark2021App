import 'package:flutter/material.dart';
import 'package:spark2021app/states/circularDot_brightBlue.dart';


// This widget contains all the Dots with color code "30E6FF"
class TreeShapeWithDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 640,
      width: double.infinity,
      child: Stack(
        children: [
          Center(child: Image.asset('images/backgroundTree.png'),),
          CircularDot(top: 170, left: 270), // Topmost
          CircularDot(top: 250, left: 130), // second
          CircularDot(top: 285, left: 215), // third from top
          CircularDot(top: 453, left: 128), // fourth from top
          CircularDot(top: 481, left: 60), // fifth from top
          CircularDot(top: 463, left: 140), // sixth from top
        ],
      ),
    );
  }
}