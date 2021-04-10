import 'package:flutter/material.dart';


// This contains the spark logo
class SparkLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 85,
        width: 314,
        child: Image.asset('images/sparkLogo.png'));
  }
}