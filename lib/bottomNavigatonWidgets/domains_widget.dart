import 'package:auto_size_text/auto_size_text.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spark2021app/constant.dart';

class DomainsWidget extends StatelessWidget {
  // final List<Widget> trackWidget = [
  //   TrackFlipCard(),
  //   TrackFlipCard(),
  //   TrackFlipCard(),
  //   TrackFlipCard(),
  //   TrackFlipCard(),
  //   TrackFlipCard(),
  // ];

  final List<String> headingTitleList = [
    'Health care and Social Responsibility',
    'Education Technology',
    'Open Innovation',
    'Safety, Security and Surveillance',
    'Blockchain and Cryptography',
    'Disaster\nManagement',
  ];

  final List<String> imageSourcePathList = [
    'images/healthcareTrack.png',
    'images/educationTrack.png',
    'images/openInnovationTrack.png',
    'images/safetyTrack.png',
    'images/blockchainTrack.png',
    'images/disasterTrack.png',
  ];

  final List<String> descriptionTextList = [
    'The world today faces a huge number of challenges in the field of healthcare '
        'and societal concerns. We, being the future of the society, hold the responsibility '
        'to use technology- a great engine of change, as a tool to tackle these problems.',

    'In today’s world, technology is incorporated in almost every aspect of our '
        'lives including education. This enables an improved learning environment '
        'which boosts student outcomes, increases student engagement '
        'and participation in class.',

    'Open Innovation uses knowledge and technological interventions to accelerate '
        'internal innovation, and expand markets for external use of innovation. '
        'Can you truly think outside the box?',

    'With the ever expanding reach of technology, and it’s influence on everyday '
        'life it is only a matter of time before technology gets intertwined with security. '
        'It is therefore necessary that such technology be made reliable and worthy of keeping human lives secure.',

    'Blockchain is the next big thing in terms of novel technology, and has been '
        'the cornerstone of a rising interest in cryptocurrency and data mining. '
        'Blockchain has been powering bitcoins and as such has highlighted it’s '
        'extensive power in the industry.',

    'Natural and manmade disasters have been a tale as old as time itself, '
        'however with modern predictive technology, and the innovations to it, '
        'we have the means to preemptively take action and save millions of lives '
        'from an untimely fate.',
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 47,
            ),
            Container(
              height: 48,
              width: 109,
              child: Text(
                'Tracks',
                style: GoogleFonts.poppins(
                    fontSize: 32, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 24.0,
                    mainAxisExtent: 179.0,
                  ),
                  itemCount: imageSourcePathList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TrackFlipCard(
                      headingText: headingTitleList[index],
                      imagePath: imageSourcePathList[index],
                      descriptionText: descriptionTextList[index],
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

class TrackFlipCard extends StatelessWidget {

  TrackFlipCard({@required this.headingText, @required this.imagePath, @required this.descriptionText });

  final String headingText;
  final String imagePath;
  final String descriptionText;

  final BoxDecoration boxDecoration = BoxDecoration(
    color: kTrackCardColor,
    borderRadius: BorderRadius.circular(22.0),
  );

  final TextStyle headingTextStyle = GoogleFonts.poppins(
    color: kTrackCardHeadingColor,
    fontSize: 12.0,
    wordSpacing: -2,
    fontWeight: FontWeight.w500,
  );

  final double cardHeight = 290;
  final double cardWidth = 160;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlipCard(
        front: Container(
          height: cardHeight,
          width: cardWidth,
          decoration: boxDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  height: 42,
                  width: 154,
                  child: AutoSizeText(
                    headingText,
                    textAlign: TextAlign.center,
                    style: headingTextStyle,
                  ),
                ),
              ),
              Container(
                height: 89,
                width: 103,
                child: Image.asset(imagePath),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        back: Container(
          height: cardHeight,
          width: cardWidth,
          decoration: boxDecoration,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Text(
                    descriptionText,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 9.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
