import 'package:flutter/material.dart';

// This is the widget for the or line on signIn or signUp
class OrWidgetDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: OrWhiteLine(height: 2, width: 120,)),
        Center(
          child: Container(
            height: 23,
            width: 23,
            decoration: BoxDecoration(
              color: Color(0xFF01294B),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                'or',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OrWhiteLine extends StatelessWidget {

  OrWhiteLine({@required this.height, @required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(top: 10.5, left: 4.5, right: 8.5),
      child: Container(
        height: 2,
        width: 314,
        color: Colors.white,
      ),
    );
  }
}