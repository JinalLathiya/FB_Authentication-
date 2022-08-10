import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/Homepage.dart';
import 'Screens/authentication.dart';
import 'Screens/emailpassword.dart';
import 'Screens/googlesignin.dart';
import 'Screens/phonesignin.dart';
import 'Screens/register.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => const Authpage(),
        "Home" : (context) => const Homepage(),
        "Register" : (context) => const SignupPage(),
        "Email&password" : (context) => const Emailpasswordlogin(),
        "Googlesignin" : (context) => const Googlesignin(),
        "Phonenumber" : (context) => const Phonesignin(),
      },
    );
  }
}
