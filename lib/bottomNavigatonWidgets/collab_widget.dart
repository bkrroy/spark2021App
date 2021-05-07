import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spark2021app/constant.dart';
import 'package:provider/provider.dart';
import 'package:spark2021app/fetching_service.dart';

class CollaborationWidget extends StatefulWidget {
  @override
  _CollaborationWidgetState createState() => _CollaborationWidgetState();
}

class _CollaborationWidgetState extends State<CollaborationWidget> {
  // final List<Widget> speakerList = [
  //   SpeakerContainer(),
  //   SpeakerContainer(),
  //   SpeakerContainer(),
  //   SpeakerContainer(),
  // ];

  List<List<String>> speakerList = [];
  List<String> sponsorsList = [];

  Future<void> getSpeakerList() async {
    final list = await context.read<FetchingService>().getSpeakerInfo();
    final list_sponsors =
        await context.read<FetchingService>().getSponsorsList();
    setState(() {
      sponsorsList = list_sponsors;
      speakerList = list;
    });
  }

  @override
  void initState() {
    getSpeakerList();
    super.initState();
  }

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
                      child: SpeakerContainer(
                        imageURL: speakerList[index][2],
                        speakerDesignation: speakerList[index][1],
                        speakerName: speakerList[index][0],
                      ),
                    );
                  },
                ),
              ),
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
                    mainAxisSpacing: 5.0,
                    mainAxisExtent: 185.0,
                  ),
                  itemCount: sponsorsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: 185,
                        width: 158,
                        child: Stack(
                          children: [
                            Container(
                              height: 185,
                              width: 158,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'images/speakerframe.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 90,
                                width: 90,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                  sponsorsList[index],
                                  fit: BoxFit.cover,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class SpeakerContainer extends StatelessWidget {
  SpeakerContainer(
      {@required this.imageURL,
      @required this.speakerName,
      @required this.speakerDesignation});

  final String imageURL;
  final String speakerName;
  final String speakerDesignation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
      width: 158,
      child: Stack(
        children: [
          Container(
            height: 185,
            width: 158,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'images/speakerframe.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height:  185,
            width: 158,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        imageURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    width: 105,
                    child: Column(
                      children: [
                        AutoSizeText(
                          speakerName,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        AutoSizeText(
                          speakerDesignation,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
