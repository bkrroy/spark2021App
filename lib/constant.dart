import 'package:flutter/material.dart';



// This is the background color for the app
const kBackgroundColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomLeft,
  colors: [
    Color(0xFF001B31),
    Color(0xFF012B4E),
    Color(0xFF001B31),
  ],
);

const kButtonWhiteColor = Color(0xFFE5E5E5);

const kLightBlueColor = Color(0xFF4BD0FB);
const kTrackCardColor = Color(0xFFCCE5FB);
const kTrackCardHeadingColor = Color(0xFF00203A);
const kLogoutButtonColor = Color(0xFF2F7BC7);


Widget appBar(BuildContext context){
 return AppBar(
   backgroundColor: Color(0xFF001B31),
   elevation: 0,
   automaticallyImplyLeading: false,
   title: GestureDetector(
     onTap: () {
       Navigator.pop(context);
     },
     child: Icon(
       Icons.chevron_left_rounded,
       size: 40,
     ),
   ),
 );
}