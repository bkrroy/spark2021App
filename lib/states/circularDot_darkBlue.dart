import 'package:flutter/material.dart';

class CircularDarkBlueDot extends StatelessWidget {

  CircularDarkBlueDot({@required this.top, @required this.left});

  final double top;
  final double left;

  final double  dotSize = 10;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        height: dotSize,
        width: dotSize,
        decoration: BoxDecoration(
          color: Color(0xFF0D5068),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
