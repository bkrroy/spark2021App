import 'package:flutter/material.dart';
import 'package:spark2021app/authentication/buttons/signUp_or_SignInButton.dart';
import 'package:spark2021app/authentication/buttons/sign_upButton.dart';
import 'package:spark2021app/authentication/buttons/white_rounded_google_auth.dart';
import 'package:spark2021app/authentication/widgets/confirm_password_widget.dart';
import 'package:spark2021app/authentication/widgets/email_id_box.dart';
import 'package:spark2021app/authentication/widgets/password_box.dart';
import 'package:spark2021app/authentication/widgets/spark_logo.dart';
import 'package:spark2021app/authentication/widgets/the_or_line.dart';
import 'package:spark2021app/states/background_widget.dart';
import 'package:spark2021app/states/combined_background_darkDots.dart';
import 'package:spark2021app/states/treeShapewithDots.dart';
import 'package:provider/provider.dart';
import 'package:spark2021app/authentication_information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';
import 'package:spark2021app/authentication_service.dart';

// This is for the SignUp
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  void initState() {
    super.initState();
    context.read<AuthenticationInformation>().initializeAsNull();
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if(firebaseUser != null){
      return HomePage();
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              BackgroundGradientWidget(),
              BackgroundDarkDots(),
              TreeShapeWithDots(),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SparkLogoWidget(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    EmailIdWidget(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    PasswordWidget(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Hero(
                        tag: 'confirmPassword',
                        child: Material(
                            color: Colors.transparent,
                            child: ConfirmPasswordWidget())),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    InkWell(
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
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    OrWidgetDisplay(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    GoogleOrAppleSignIn(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    SignInOrSignOutScreenNavigator(screenName: 'sign in',),
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




