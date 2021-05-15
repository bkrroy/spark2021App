import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spark2021app/constant.dart';
import 'package:spark2021app/states/background_widget.dart';

//REMOVED THIS SCREEN FOR NOW

class AboutISAVITPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context),
        body: Container(
          height: height,
          width: width,
          child: Stack(
            children: [
              BackgroundGradientWidget(),
              Container(
                height: height,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 290,
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'About ',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF4BD0FB),
                              fontSize: 40,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'ISA-VIT',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
    );
  }
}
