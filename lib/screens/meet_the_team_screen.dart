import 'package:flutter/material.dart';
import 'package:spark2021app/states/background_widget.dart';
import 'package:spark2021app/constant.dart';

class MeetTheTeamScreen extends StatelessWidget {
  final List<String> imageLinkList = [
    "https://firebasestorage.googleapis.com/v0/b/isa-vit.appspot.com/o/Board%20Members%2Fbrajesh.png?alt=media&token=de526d9a-f20e-441a-803d-0b46ae3aea5e",
    "https://firebasestorage.googleapis.com/v0/b/isa-vit.appspot.com/o/Board%20Members%2Fsomya.png?alt=media&token=170c54c5-9810-4956-99f9-f1a2fe90b1cc",
    "https://firebasestorage.googleapis.com/v0/b/isa-vit.appspot.com/o/Board%20Members%2Fprishita_raj.png?alt=media&token=b1d8bff4-6e5a-4d9f-b1c8-171b54f3ffa2",
    "https://firebasestorage.googleapis.com/v0/b/isa-vit.appspot.com/o/Board%20Members%2Fpranav.png?alt=media&token=e5ea2646-2626-4b42-8461-9b1f35507a13",
    "https://firebasestorage.googleapis.com/v0/b/isa-vit.appspot.com/o/Board%20Members%2Fvatsal.png?alt=media&token=3c6d40e7-5ae5-42f3-ae00-e53ebc3d3c6c",
    "https://firebasestorage.googleapis.com/v0/b/isa-vit.appspot.com/o/Board%20Members%2Fpratham.png?alt=media&token=ac90ad86-1360-42a7-b4c7-5dcea4f87d7e",
    "https://firebasestorage.googleapis.com/v0/b/isa-vit.appspot.com/o/Board%20Members%2Fanannya.png?alt=media&token=f1c81873-35e7-4d26-898b-cc10878872ff"
  ];

  final List<String> personNameList = [
    "Brajesh Kumar Roy",
    "Somya Khatri",
    "Prishita Raj",
    "Pranav Prakasan",
    "Vatsal Verma",
    "Pratham Shah",
    "Anannya Popat"
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
          SingleChildScrollView(
            child: Container(
              width: screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Developers',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 40,
                      color: kLightBlueColor,
                    ),
                  ),
                  ProfileViewRowWidget(
                    firsPersonProfilePhotoLink: imageLinkList[0],
                    secondPeronProfilePhotoLink: imageLinkList[1],
                    firstPersonName: personNameList[0],
                    secondPersonName: personNameList[1],
                    designation: 'Developer',
                  ),
                  ProfileViewRowWidget(
                    firsPersonProfilePhotoLink: imageLinkList[2],
                    secondPeronProfilePhotoLink: imageLinkList[3],
                    firstPersonName: personNameList[2],
                    secondPersonName: personNameList[3],
                    designation: 'Designer',
                  ),
                  ProfileViewRowWidget(
                    firsPersonProfilePhotoLink: imageLinkList[4],
                    secondPeronProfilePhotoLink: imageLinkList[5],
                    firstPersonName: personNameList[4],
                    secondPersonName: personNameList[5],
                    designation: 'Designer',
                  ),
                  InformationColumnWidget(
                    networkImage: imageLinkList[6],
                    personName: personNameList[6],
                    designation: "Designer",
                  ),
                  SizedBox(
                    height: 10,
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

class ProfileViewRowWidget extends StatelessWidget {
  ProfileViewRowWidget(
      {this.firstPersonName,
      this.secondPersonName,
      this.designation,
      this.firsPersonProfilePhotoLink,
      this.secondPeronProfilePhotoLink});

  final String firstPersonName;
  final String secondPersonName;
  final String designation;
  final String firsPersonProfilePhotoLink;
  final String secondPeronProfilePhotoLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 298,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InformationColumnWidget(
            networkImage: firsPersonProfilePhotoLink,
            personName: firstPersonName,
            designation: designation,
          ),
          InformationColumnWidget(
            networkImage: secondPeronProfilePhotoLink,
            personName: secondPersonName,
            designation: designation,
          ),
        ],
      ),
    );
  }
}

class InformationColumnWidget extends StatelessWidget {
  InformationColumnWidget(
      {this.networkImage, this.personName, this.designation});

  final String networkImage;
  final String personName;
  final String designation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 118,
      child: Column(
        children: [
          Container(
            height: 150,
            width: 118,
            child: Image.network(
              networkImage,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            personName,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: kLightBlueColor,
              fontSize: 12.0,
            ),
          ),
          Text(
            designation,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}
