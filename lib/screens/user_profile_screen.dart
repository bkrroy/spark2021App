import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spark2021app/authentication_service.dart';
import 'package:spark2021app/constant.dart';
import 'package:spark2021app/google_authentication.dart';
import 'package:spark2021app/states/background_widget.dart';
import 'package:spark2021app/states/glass_display_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';


//THIS IS THE ABOUT ISA-VIT Page in the App
class UserProfileScreen extends StatelessWidget {






  // final List<Widget> infoWidgetList = [
  //   InformationTextWidget(),
  //   InformationTextWidget(),
  //   InformationTextWidget(),
  //   InformationTextWidget(),
  // ];

 // final List<String> headingTextList = [
 //   'Name',
 //   'Institution',
  //  'Email address',
  //  'Registration No.',
 //];

 // final List<String> infoTextList = [
 //   'Pranav',
  //  'Vellore Institute of Technology',
  //  'xdwc',
   // '19BCE2028',
  //];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
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
                            'About ISA-VIT',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: kLightBlueColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 35,
                            ),
                          ),
                        ),
                        SizedBox(height: 40,),

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
                                child: Container(
                                  height: height,
                                  width: width,
                                  child: Stack(
                                    children: [
                                      //BackgroundGradientWidget(),
                                      Container(
                                        height: height,
                                        width: width,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: height * 0.07,
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: width * 0.8,
                                                child: Text(
                                                  'ISA-VIT works under the international Society of Automation as a non-profit'
                                                      'student Chapter in VIT University. Our vision is to set a standard for those who'
                                                      'apply technology and engineering to improve the management, safety, and securtiy of '
                                                      'modern automation and embedded systems throughout the industry',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 16.0,
                                                      color: Colors.black

                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],

                                  ),
                                ),

                              ),
                              SizedBox(height: 20,),
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

// class InformationTextWidget extends StatelessWidget {
//   InformationTextWidget({@required this.headingText, @required this.infoText});
//
//   final String headingText;
//   final String infoText;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 82,
//       width: 316,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             headingText,
//             style: GoogleFonts.poppins(
//               fontSize: 24,
//               fontWeight: FontWeight.w600,
//               color: Colors.black,
//             ),
//           ),
//           AutoSizeText(
//             infoText,
//             maxLines: 2,
//             style: GoogleFonts.poppins(
//               fontSize: 14,
//               fontWeight: FontWeight.normal,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }