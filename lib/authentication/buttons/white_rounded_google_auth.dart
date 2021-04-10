import 'package:flutter/material.dart';

/*
The following widget contains two button
1. for the google signin
2. for the apple signin
 */
//TODO: TO implement the actual authentication process for google as well as apple
class GoogleOrAppleSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OtherSignInWhiteContainer(imagePath: 'images/googleLogo.png'),
          SizedBox(
            width: 20,
          ),
          OtherSignInWhiteContainer(
            imagePath: 'images/appleLogo.png',
          ),
        ],
      ),
    );
  }
}

// This is the background circular widget for the google and apple
// sign in methods
class OtherSignInWhiteContainer extends StatelessWidget {
  OtherSignInWhiteContainer({@required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 28.0,
      child: Image.asset(
        imagePath,
      ),
    );
  }
}
