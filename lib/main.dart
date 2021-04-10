import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:spark2021app/authentication_information.dart';
import 'package:spark2021app/authentication_service.dart';
import 'package:spark2021app/screens/signin.dart';
import 'package:spark2021app/screens/signup.dart';
import 'screens/prizes_screen.dart';
import 'screens/landingPage.dart';
import 'screens/user_profile_screen.dart';
import 'screens/meet_the_team_screen.dart';
import 'screens/annnouncements_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        ),
        ChangeNotifierProvider<AuthenticationInformation>(
          create: (_) => AuthenticationInformation(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => LandingPage(),
          '/signUp': (context) => SignUp(),
          '/signIn': (context) => SignIn(),
          '/prizes': (context) => PrizesScreen(),
          '/profileScreen' : (context) => UserProfileScreen(),
          '/meetTheTeamScreen' : (context) => MeetTheTeamScreen(),
          '/announcementScreen' : (context) => AnnouncementScreen(),
        },
        title: 'Spark2021',
        theme: ThemeData.dark(),
      ),
    );
  }
}
