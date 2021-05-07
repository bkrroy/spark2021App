import 'package:flutter/material.dart';
import 'package:spark2021app/constant.dart';
import 'package:provider/provider.dart';
import 'package:spark2021app/authentication_service.dart';
import 'package:spark2021app/authentication_information.dart';

// This widget would contain the email id
class EmailIdWidget extends StatefulWidget {
  @override
  _EmailIdWidgetState createState() => _EmailIdWidgetState();
}

class _EmailIdWidgetState extends State<EmailIdWidget> {

  bool autoFocusValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.36,
      width: 314,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10),
        child: TextField(
          autofocus: autoFocusValue,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Email',
          ),
          onChanged: (value) {
            setState(() {
              autoFocusValue = true;
            });
            context.read<AuthenticationInformation>().onChangeEmail(value: value);
          },
        ),
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF536C82).withOpacity(0.7),
            Color(0xFF365771).withOpacity(0.7),
          ]),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: kButtonWhiteColor, width: 2)),
    );
  }
}