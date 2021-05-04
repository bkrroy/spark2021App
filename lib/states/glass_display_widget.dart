import 'package:flutter/material.dart';

/// This widget is for the glass display for prizes, announcements, meet the team, Profile
class GlassDisplayWidget extends StatelessWidget {
  GlassDisplayWidget(
      {@required this.imageLocation, @required this.text, this.screenName});

  final String imageLocation;
  final String text;
  final String screenName;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, screenName);
      },
      child: Container(
        height: screenHeight * 0.15,
        width: screenWidth * 0.95,
        child: Stack(
          children: [
            Image.asset(imageLocation),
            Positioned(
              top: 18,
              left: 30,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}