import 'package:flutter/material.dart';


// This widget provides us with circular dots
// in parameters it takes the top and left for the position on the screen
class CircularDot extends StatelessWidget {

  CircularDot({@required this.top, @required this.left});

  final double top;
  final double left;
  final double dotSize = 10;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top, // 0.805
      left: left, // 0.335
      child: Container(
        height: dotSize,
        width: dotSize,
        decoration: BoxDecoration(
          color: Color(0xFF30E6FF),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}