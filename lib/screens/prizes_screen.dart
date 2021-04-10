import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark2021app/constant.dart';
import 'package:spark2021app/states/background_widget.dart';

class PrizesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            BackgroundGradientWidget(),
            Container(
              width: screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Prizes',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 40,
                      color: kLightBlueColor,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  PrizeRowWidget(
                    prizeImagePath: 'images/firstPrize.png',
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  PrizeRowWidget(
                    prizeImagePath: 'images/secondPrize.png',
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  PrizeRowWidget(
                    prizeImagePath: 'images/thirdPrize.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrizeRowWidget extends StatelessWidget {
  PrizeRowWidget({this.prizeImagePath});

  final String prizeImagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      width: 337,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(prizeImagePath),
          Container(
            height: 86,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: kLightBlueColor,
              ),
            ),
          ),
          Container(
            height: 86,
            width: 213,
            decoration: BoxDecoration(
                color: Color(0xFFCCE5Fb),
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(
                'TBD',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 28.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
