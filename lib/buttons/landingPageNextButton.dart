import 'package:flutter/material.dart';
import 'package:spark2021app/constant.dart';
import 'package:spark2021app/screens/signin.dart';

class LandingPageNextButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 40,
        width: 81.33,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kButtonWhiteColor, width: 2),
        ),
        child: Center(
          child: Text(
            'Next',
            style: TextStyle(
                fontSize: 22.67,
                fontFamily: 'Poppins'
            ),
          ),
        ),
      ),
      onTap: (){
        Navigator.push(context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, animationTime, child){
            animation = CurvedAnimation(parent: animation, curve: Curves.decelerate);
            return ScaleTransition(
              alignment: Alignment.bottomRight*0.8,
              scale: animation,
              child: child,
            );
          },
          pageBuilder: (context, animation, animationTime){
            return SignIn();
          }
        ),
        );
      },
    );
  }
}