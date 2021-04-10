import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';

class FAQWidget extends StatelessWidget {
  List<String> _headingTextList = [
    "Can I take part in iHACK if I am alone/don’t have teammates?",
    "How long is the Hackathon? I the event paid?",
    "Will there be any events conducted in the days leading up to the main event?",
  ];
  List<String> _descriptionTextList = [
    "Yes, you can, but you will be provided teammates randomly.",
    "The entire hackathon will be 48 hours long and it is completely free of cost.",
    "Yes, there will be workshops conducted weeks prior to the hackathon. These workshops will have topics based on the tracks for the hackathon.",
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
                    padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    child: ExpansionCard(
                      background: Container(
                        color: Color(0xFF2B4459),
                        height: 65.0 * 3,
                      ),
                      title: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        height: 60,
                        width: screenWidth * 0.8,
                        child: Text(
                          _headingTextList[index],
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 5, left: 15, right: 15),
                          child: Text(
                            _descriptionTextList[index],
                            style: TextStyle(
                              fontFamily: 'Poppins'
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
