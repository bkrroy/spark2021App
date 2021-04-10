import 'package:flutter/material.dart';

class AuthenticationInformation extends ChangeNotifier {
  /*
    =============== START OF SECTION TO GET USER AUTHENTICATION INFORMATION =====================
   */

  /// This is to get email, password and confirm password text
  String _email = "";
  String _password = "";
  String _confirmPassword = "";


  /// Whenever user goes to singIn or signUp page this function should be called
  /// This is done to prevent any garbage value being stored while switching
  /// through the screens
  void initializeAsNull(){
    _email = "";
    _password = "";
    _confirmPassword = "";
  }

  void onChangeEmail({String value}){
    _email = value;
    print(_email);
  }

  void onChangedPassword({String value}){
    _password = value;
  }

  void onChangedConfirmPassword({String value}){
    _confirmPassword = value;
  }

  String returnEmail(){
    return _email;
  }

  String returnPassword(){
    return _password;
  }

  String returnConfirmPassword(){
    return _confirmPassword;
  }

/*
    =============== END OF SECTION TO GET USER AUTHENTICATION INFORMATION =====================
   */
}