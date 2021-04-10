import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatelessWidget {
  final double headingFontSize = 35.0; // This is for "hey there" text size

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// This container is for the spark logo
          Container(
            width: 178,
            child: Image.asset('images/sparkLogo.png'),
          ),

          /// This container is for the Hey there text
          Container(
            width: 209,
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: 'Hey ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF4BD0FB),
                    fontSize: headingFontSize,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'there!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GlassDisplayWidget(
            imageLocation: 'images/darkBlueGlass.png',
            text: 'Prizes',
            screenName: '/prizes',
          ),
          GlassDisplayWidget(
            imageLocation: 'images/lightBlueGlass.png',
            text: 'Announcements',
            screenName: '/announcementScreen',
          ),
          GlassDisplayWidget(
            imageLocation: 'images/darkBlueGlass.png',
            text: 'Meet the team',
            screenName: '/meetTheTeamScreen',
          ),
          GlassDisplayWidget(
            imageLocation: 'images/lightBlueGlass.png',
            text: 'Profile',
            screenName: '/profileScreen',
          ),
        ],
      ),
    );
  }
}

/// This widget is for the glass display for prizes, announcements, meet the team, Profile
class GlassDisplayWidget extends StatelessWidget {
  GlassDisplayWidget({@required this.imageLocation, @required this.text, this.screenName});

  final String imageLocation;
  final String text;
  final String screenName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, screenName);
      },
      child: Container(
        height: 86,
        width: 364,
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
