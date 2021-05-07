import 'package:flutter/material.dart';
import 'package:spark2021app/states/background_widget.dart';

class AnnouncementScreen extends StatelessWidget {
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
          ],
        ),
      ),
    );
  }
}
