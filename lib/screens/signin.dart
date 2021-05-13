import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark2021app/authentication/buttons/signUp_or_SignInButton.dart';
import 'package:spark2021app/authentication/widgets/email_id_box.dart';
import 'package:spark2021app/authentication/widgets/password_box.dart';
import 'package:spark2021app/authentication/widgets/spark_logo.dart';
import 'package:spark2021app/authentication/widgets/the_or_line.dart';
import 'package:spark2021app/authentication/buttons/white_rounded_google_auth.dart';
import 'package:spark2021app/authentication/buttons/sign_inButton.dart';
import 'package:spark2021app/google_authentication.dart';
import 'package:spark2021app/states/background_widget.dart';
import 'package:spark2021app/states/combined_background_darkDots.dart';
import 'package:spark2021app/states/treeShapewithDots.dart';
import 'package:provider/provider.dart';
import 'package:spark2021app/authentication_information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';
import 'package:spark2021app/authentication_service.dart';

// This is for the sign in screen
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  void initializeNull() {
    context.read<AuthenticationInformation>().initializeAsNull();
  }

  @override
  void initState() {
    super.initState();
    initializeNull();
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomePage();
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);

              if (provider.isSigningIn) {
                return buildLoading();
              } else if(snapshot.hasData){
                return HomePage();
              }
              else {
                return Container(
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SparkLogoWidget(),
                            // This widget takes in the email Id of people
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.09,
                            ),
                            EmailIdWidget(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            PasswordWidget(),
                            Hero(
                              tag: 'confirmPassword',
                              child: Container(
                                height: 0,
                                width: 0,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            InkWell(
                              enableFeedback: true,
                              child: Container(
                                height: 45,
                                width: 143,
                                decoration: BoxDecoration(
                                  color: Color(0xFF2F7BC7),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);
                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                String email = context
                                    .read<AuthenticationInformation>()
                                    .returnEmail();
                                String password = context
                                    .read<AuthenticationInformation>()
                                    .returnPassword();
                                context
                                    .read<AuthenticationService>()
                                    .signIn(email: email, password: password);
                              },
                            ),
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.height * 0.08,
                            // ),
                            //OrWidgetDisplay(),
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.height * 0.03,
                            // ),
                            // Center(
                            //   child: Text('Sign in with'),
                            // ),
                            // SizedBox(
                            //   height:
                            //       MediaQuery.of(context).size.height * 0.018,
                            // ),
                            // GestureDetector(
                            //   onTap: (){
                            //     final provider =
                            //         Provider.of<GoogleSignInProvider>(context, listen: false);
                            //     provider.login();
                            //   },
                            //   child: GoogleOrAppleSignIn(),
                            // ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.023,
                            ),
                            SignInOrSignOutScreenNavigator(
                                screenName: 'sign up'),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }

  Widget buildLoading() => Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.blue,
        ),
      );
}
