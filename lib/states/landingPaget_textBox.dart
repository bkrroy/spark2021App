import 'package:flutter/material.dart';


class LandingPageTextBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      width: 200,
      child: Text(
        'Welcome participant, to the plug for '
            'all things spark. Here,'
            'you will receive all the '
            'updates for upcoming events in spark\'21',
        textAlign: TextAlign.right,
        style: TextStyle(
            fontSize: 12,
            fontFamily: 'Poppins'
        ),
      ),
    );
  }
}