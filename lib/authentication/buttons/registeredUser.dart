import 'package:flutter/material.dart';

class registeredUser extends StatelessWidget {

  registeredUser({@required this.screenName});

  final String screenName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an account? ',
            style: TextStyle(
              wordSpacing: 2,
            ),
          ),
          GestureDetector(
            child: Text(
              screenName,
              style: TextStyle(wordSpacing: 1, color: Color(0xFF2F7BC7)),
            ),
            onTap: () {
              if(screenName == 'sign in'){
                Navigator.pushNamedAndRemoveUntil(context, '/signIn', (Route<dynamic>route) => false);
              }else {
                Navigator.pushNamed(context, '/signUp');
                //Navigator.pushNamedAndRemoveUntil(context, '/signUp', (Route<dynamic>route) => false);
              }
            },
          ),
        ],
      ),
    );
  }
}