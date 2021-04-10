// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:spark2021app/authentication_information.dart';
// import 'package:spark2021app/authentication_service.dart';
// import 'package:spark2021app/screens/home_screen.dart';
//
//
// // This Widget is for the SignIn button
// class SignInButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<User>();
//
//     if(firebaseUser != null){
//       return HomeScreen();
//     }
//     return InkWell(
//       enableFeedback: true,
//       child: Container(
//         height: 45,
//         width: 143,
//         decoration: BoxDecoration(
//           color: Color(0xFF2F7BC7),
//           borderRadius: BorderRadius.circular(8.0),
//           border: Border.all(
//             width: 2,
//             color: Colors.white,
//           ),
//         ),
//         child: Center(
//           child: Text(
//             'Sign In',
//             style: TextStyle(
//               fontSize: 18.0,
//             ),
//           ),
//         ),
//       ),
//       onTap: (){
//         String email = context.read<AuthenticationInformation>().returnEmail();
//         String password = context.read<AuthenticationInformation>().returnPassword();
//         context.read<AuthenticationService>().signIn(email: email, password: password);
//       },
//     );
//   }
// }