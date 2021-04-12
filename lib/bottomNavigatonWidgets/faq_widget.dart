import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQWidget extends StatelessWidget {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  List<String> _headingTextList = [
    "Can I take part in iHACK if I am alone/don’t have teammates?",
    "How long is the Hackathon? Is the event paid?",
    "Will there be any events conducted in the days leading up to the main event?",
    "How do I get in touch with mentors?",
    "What can be the size of team?",
    "What if I don't have any coding background",
    "Can we base our submission off of an earlier prepared project?",
    "How can I be notified of all the updates about the upcoming events and the hackathon?",
    "Do I need to give a demo for the product I have built?",
    "Do we need to have the entire idea completely working?"
  ];
  List<String> _descriptionTextList = [
    "Yes, you can, but you will be provided teammates randomly.",
    "The entire hackathon will be 48 hours long and it is completely free of cost.",
    "Yes, there will be workshops conducted weeks prior to the hackathon. These workshops will have topics based on the tracks for the hackathon.",
    "A channel will be provided on the Discord server to help you get in touch with the mentors.",
    "A minimum of 2 and maximum of 5 members in one team.",
    "There are several workshops being held before and during the event where you can get to learn a lot. Moreover, the mentors will be ready to help you.",
    "No, your projects must be built from scratch, however you can incorporate previously built APIs in your submission.",
    "You can join the Discord server through the link on the home page, and you can also download the SPARK’21 app available on Google Play Store.",
    "If you wish to submit a small presentation or video that demonstrates the working of your product, you may do so. However, it’s not mandatory.",
    "The entire idea need not be fully implemented however, the submission should be functional so that it can be reviewed by the judges.",
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      child: Column(
        children: [
          Container(
            height: 150,
            width: screenWidth,
            child: Stack(
              children: [
                Container(
                  height: 170,
                  width: screenWidth,
                  child: Image.asset(
                    'images/faqBanner.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'FAQs',
                        style: TextStyle(fontSize: 64.0, fontFamily: 'Poppins'),
                      ),
                      Text(
                        'Frequently Asked Questions',
                        style: TextStyle(fontSize: 10.0, fontFamily: 'Poppins'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: ListView.builder(
                itemCount: _headingTextList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 10),
                    child: ExpansionTileCard(
                      baseColor: Color(0xFF2B4459),
                      expandedColor: Color(0xFF2B4459),
                      expandedTextColor: Color(0xFF4BD0FB),
                      title: Text(
                        _headingTextList[index],
                        style: GoogleFonts.poppins(),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Container(
                            child: Text(
                              _descriptionTextList[index],
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
