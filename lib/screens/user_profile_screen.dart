import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spark2021app/authentication_service.dart';
import 'package:spark2021app/constant.dart';
import 'package:spark2021app/states/background_widget.dart';
import 'package:spark2021app/states/glass_display_widget.dart';

class UserProfileScreen extends StatelessWidget {
  // final List<Widget> infoWidgetList = [
  //   InformationTextWidget(),
  //   InformationTextWidget(),
  //   InformationTextWidget(),
  //   InformationTextWidget(),
  // ];

  final List<String> headingTextList = [
    'Name',
    'Institution',
    'Email address',
    'Registration No.',
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                height: screenHeight,
                width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 127,
                      child: Text(
                        'Profile',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: kLightBlueColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    GlassDisplayWidget(
                      imageLocation: 'images/darkBlueGlass.png',
                      text: 'About ISA-VIT',
                      screenName: '/',
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18.0, vertical: 27),
                      height: 450,
                      width: 352,
                      decoration: BoxDecoration(
                        color: kTrackCardColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: ListView.builder(
                        itemCount: headingTextList.length,
                        itemBuilder: (context, index) {
                          return InformationTextWidget(
                              headingText: headingTextList[index]);
                        },
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

class InformationTextWidget extends StatelessWidget {
  InformationTextWidget({@required this.headingText});

  final String headingText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      width: 316,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headingText,
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Text(
            'Pratham Shah',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
//
// FlatButton(
// child: Text('SignOut'),
// onPressed: (){
// context.read<AuthenticationService>().signOut().then((value) {
// Navigator.pushNamed(context, '/signIn');
// });
// },
// )
