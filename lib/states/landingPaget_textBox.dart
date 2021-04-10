import 'package:flutter/material.dart';


class LandingPageTextBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      width: 200,
      child: Text(
        'Welcome participant,\nto the plug for '
            'all things spark. Here,'
            'you will receive all the '
            'updates for upcoming events \nin spark\'21',
        textAlign: TextAlign.right,
        style: TextStyle(
            fontSize: 15,
            fontFamily: 'Poppins'
        ),
      ),
    );
  }
}