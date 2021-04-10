import 'package:flutter/material.dart';
import 'package:spark2021app/constant.dart';

class BackgroundGradientWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: kBackgroundColor
      ),
    );
  }
}