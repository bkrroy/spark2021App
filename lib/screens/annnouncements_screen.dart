import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spark2021app/constant.dart';
import 'package:spark2021app/states/background_widget.dart';
import 'package:provider/provider.dart';
import 'package:spark2021app/fetching_service.dart';

class AnnouncementScreen extends StatefulWidget {
  @override
  _AnnouncementScreenState createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  String text = '';

  Future<void> getText() async {
    final txt = await context.read<FetchingService>().getAnnouncements();
    setState(() {
      text = txt;
    });
  }

  @override
  void initState() {
    getText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
        body: Stack(
          children: [
            BackgroundGradientWidget(),
            Container(
              height: screenHeight,
              width: screenWidth,
              child: Center(
                child: Image.asset('images/announcementImage.png'),
              ),
            ),
            Positioned(
              left: 35,
              right: 35,
              child: Container(
                width: screenWidth * 0.7,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Announcements',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 35.0,
                          color: kLightBlueColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      width: screenWidth * 0.7,
                      height: screenHeight * 0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: kTrackCardColor),
                      child: Center(
                        child:Text(
                        text,
                        style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
