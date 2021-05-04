import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollaborationWidget extends StatelessWidget {
  final List<Widget> speakerList = [
    SpeakerContainer(),
    SpeakerContainer(),
    SpeakerContainer(),
    SpeakerContainer(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 42,
            ),
            Container(
              height: 48,
              width: 152,
              child: Text(
                'Speakers',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              height: 220,
              width: MediaQuery.of(context).size.width,
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll) {
                  overScroll.disallowGlow();
                  return;
                },
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: speakerList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: speakerList[index],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 48,
              width: 152,
              child: Text(
                'Sponsors',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll) {
                  overScroll.disallowGlow();
                  return;
                },
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 5.0,
                    mainAxisExtent: 158.0,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 158,
                        width: 158,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFF8D9CA8),
                              Color(0xFF5E7384),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Container(
                            height: 90,
                            width: 90,
                            child: Image.asset('images/speaker.png'),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpeakerContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
      width: 158,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF8D9CA8),
            Color(0xFF5E7384),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 90,
            width: 90,
            child: Image.asset('images/speaker.png'),
          ),
          Container(
            height: 40,
            width: 105,
            child: Column(
              children: [
                Text(
                  'Pranav Prakasan',
                  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Project Head',
                  style: GoogleFonts.poppins(fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
