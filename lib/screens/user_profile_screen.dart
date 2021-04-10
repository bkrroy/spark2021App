import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark2021app/authentication_service.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      child: FlatButton(
        child: Text('SignOut'),
        onPressed: (){
          context.read<AuthenticationService>().signOut().then((value) {
            Navigator.pushNamed(context, '/signIn');
          });
        },
      )
    );
  }
}
