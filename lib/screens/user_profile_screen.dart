import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spark2021app/authentication_service.dart';
import 'package:spark2021app/constant.dart';
import 'package:spark2021app/google_authentication.dart';
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

  final List<String> infoTextList = [
    'Pratham Shah',
    'Vellore Institute of Technology',
    'ananyarajesh.popat2019@vitstudent.ac.in',
    '19BCE2028',
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context),
        body: Stack(
          children: [
            BackgroundGradientWidget(),
            NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll){
                overScroll.disallowGlow();
                return;
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    width: screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            print('Hello World');
                            print(screenHeight);
                          },
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
                        SizedBox(height: 20,),
                        GlassDisplayWidget(
                          imageLocation: 'images/darkBlueGlass.png',
                          text: 'About ISA-VIT',
                          screenName: '/aboutISA-VIT',
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
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: headingTextList.length,
                                  itemBuilder: (context, index) {
                                    return InformationTextWidget(
                                      headingText: headingTextList[index],
                                      infoText: infoTextList[index],
                                    );
                                  },
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  context.read<GoogleSignInProvider>().logout();
                                  context
                                      .read<AuthenticationService>()
                                      .signOut()
                                      .then(
                                    (value) {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          '/signIn',
                                          (Route<dynamic> route) => false);
                                    },
                                  );
                                },
                                child: Container(
                                  height: 38,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: kLogoutButtonColor,
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Logout',
                                      style: GoogleFonts.poppins(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
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
  InformationTextWidget({@required this.headingText, @required this.infoText});

  final String headingText;
  final String infoText;

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
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          AutoSizeText(
            infoText,
            maxLines: 2,
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