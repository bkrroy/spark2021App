import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spark2021app/authentication_service.dart';
import 'package:spark2021app/authentication_information.dart';
import 'package:spark2021app/screens/home_page.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if(firebaseUser != null){
      return HomePage();
    }
    return InkWell(
      onTap: (){
        String email = context.read<AuthenticationInformation>().returnEmail();
        String password = context.read<AuthenticationInformation>().returnPassword();
        context.read<AuthenticationService>().signUp(email: email, password: password);
      },
      child: Container(
        height: 45,
        width: 143,
        decoration: BoxDecoration(
          color: Color(0xFF2F7BC7).withOpacity(0.5),
          border: Border.all(
            width: 2,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
