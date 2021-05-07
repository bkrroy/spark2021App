import 'package:flutter/material.dart';
import 'package:spark2021app/buttons/landingPageNextButton.dart';
import 'package:spark2021app/states/background_widget.dart';
import 'package:spark2021app/states/combined_background_darkDots.dart';
import 'package:spark2021app/states/landingPaget_textBox.dart';
import 'package:spark2021app/states/treeShapewithDots.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          BackgroundGradientWidget(),
          // This for the all the
          BackgroundDarkDots(),
          Column(
            children: [
              //SizedBox(height: MediaQuery.of(context).size.height *0.10,),
              TreeShapeWithDots(),
            ],
          ),
          // To give animation to spark Logo
          SparkLogoWithTextWidget(),
          // This for the text and Next Button
          Positioned(
            bottom: screenHeight*0.07,
            left: screenWidth*0.45,
            right: screenWidth*0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                LandingPageTextBox(),
                SizedBox(height: screenHeight * 0.01,),
                LandingPageNextButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SparkLogoWithTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 230, left: 48, right: 56),
      child: Column(
        children: [
          Image.asset('images/sparkLogoWithText.png'),
        ],
      ),
    );
  }
}
















