import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spark2021app/constant.dart';

class TimeLineWidget extends StatelessWidget {
  final TextStyle dayTextStyle = GoogleFonts.poppins(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: kLightBlueColor,
  );

  final List<String> dayOneTimeList = [
    '10:30 am',
    '1:00 pm',
    '4:00 pm',
    '9:00 pm',
    '7:00 pm',
    '11:30 pm',
  ];

  final List<String> firstDayInfo = [
    'Inaugural Ceremony',
    'Hack Begins',
    'Technical Session 1',
    'Review 1',
    'Technical Session 2',
    'Recreational Activities',
  ];

  final List<String> secondDayTimeList = [
    '11:00 am',
    '1:00 pm',
    '3:30 pm',
    '7:00 pm',
  ];

  final List<String> secondDayInfo = [
    'Technical Session 3',
    'Review 2',
    'Recreational Activities',
    'Technical Session 4',
  ];

  final List<String> thirdDayTimeList = [
    '1:00 pm',
    '6:00 pm',
  ];

  final List<String> thirdDayInfo = [
    'Final Submission',
    'Closing Ceremony',
  ];

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
              width: screenWidth * 0.99,
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
                      TimeLineContainer(
                        dayList: dayOneTimeList,
                        dayInfoList: firstDayInfo,
                      ),
                      Text(
                        'Day 2',
                        style: dayTextStyle,
                      ),
                      TimeLineContainer(
                        dayList: secondDayTimeList,
                        dayInfoList: secondDayInfo,
                      ),
                      Text(
                        'Day 3',
                        style: dayTextStyle,
                      ),
                      TimeLineContainer(
                        dayList: thirdDayTimeList,
                        dayInfoList: thirdDayInfo,
                      ),
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
  TimeLineContainer({@required this.dayList, @required this.dayInfoList});

  final List<String> dayList;
  final List<String> dayInfoList;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.78,
      height: dayList.length * 85.0,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dayList.length,
        itemBuilder: (context, index) {
          return TimeLineInformation(
            leadingDots: index < (dayList.length - 1) ? true : false,
            time: dayList[index],
            info: dayInfoList[index],
          );
        },
      ),
    );
  }
}

class TimeLineInformation extends StatelessWidget {
  TimeLineInformation(
      {@required this.leadingDots,
      this.firstDotVisible,
      @required this.time,
      @required this.info});

  final bool leadingDots;
  final bool firstDotVisible;
  final String time;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.78,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                child: Text(time),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                      height: 65,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DotTimeLineWidget(),
                          leadingDots ? LeadingDots() : Container(),
                          leadingDots ? LeadingDots() : Container(),
                          leadingDots ? LeadingDots() : Container(),
                        ],
                      ),
                    ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 20,
                child: AutoSizeText(info, maxLines: 1, style: GoogleFonts.poppins(fontSize: 6),),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
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
