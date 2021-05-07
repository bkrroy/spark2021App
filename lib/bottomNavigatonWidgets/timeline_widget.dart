import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spark2021app/constant.dart';

class TimeLineWidget extends StatelessWidget {
  final TextStyle dayTextStyle = GoogleFonts.poppins(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: kLightBlueColor,
  );

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: screenHeight * 0.75,
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                border: Border.all(color: kLightBlueColor, width: 3),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Day 1',
                        style: dayTextStyle,
                      ),
                      TimeLineContainer(),
                      Text(
                        'Day 2',
                        style: dayTextStyle,
                      ),
                      TimeLineContainer(),
                      Text(
                        'Day 3',
                        style: dayTextStyle,
                      ),
                      TimeLineContainer(),
                    ],
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

class TimeLineContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.78,
      child: Column(
        children: [
          TimeLineInformation(leadingDots: true,),
          TimeLineInformation(leadingDots: true,),
          TimeLineInformation(leadingDots: true,),
          TimeLineInformation(leadingDots: false,),
        ],
      ),
    );
  }
}

class TimeLineInformation extends StatelessWidget {

  TimeLineInformation({@required this.leadingDots, this.firstDotVisible});

  final bool leadingDots;
  final bool firstDotVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('8:00 am'),
            SizedBox(width: 20,),
            DotTimeLineWidget(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('Comment'),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        leadingDots ? Container(
          height: 35,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LeadingDots(),
              LeadingDots(),
              LeadingDots(),
            ],
          ),
        ) : Container(),
      ],
    );
  }
}

class LeadingDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: 6,
      decoration: BoxDecoration(
        color: Color(0xFF97DDF1),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}

class DotTimeLineWidget extends StatelessWidget {
  final double firstDotHeight = 18.0;
  final double secondDotHeight = 12.0;
  final double thirdDotHeight = 8.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: firstDotHeight,
      width: firstDotHeight,
      decoration: BoxDecoration(
        color: kLightBlueColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Container(
          height: secondDotHeight,
          width: secondDotHeight,
          decoration: BoxDecoration(
            color: kTrackCardHeadingColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Container(
              height: thirdDotHeight,
              width: thirdDotHeight,
              decoration: BoxDecoration(
                color: kLightBlueColor,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
