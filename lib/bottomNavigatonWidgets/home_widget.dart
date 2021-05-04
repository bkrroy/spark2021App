import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark2021app/states/glass_display_widget.dart';

class HomeWidget extends StatelessWidget {
  final double headingFontSize = 35.0; // This is for "hey there" text size

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
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
      ),
    );
  }
}


