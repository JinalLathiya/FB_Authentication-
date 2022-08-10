import 'package:firebase_authen/Helpers/auth_helpers.dart';
import 'package:flutter/material.dart';

class Authpage extends StatefulWidget {
  const Authpage({Key? key}) : super(key: key);

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Authentication"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Anonymous Login"),
              onPressed: () {
                dynamic res = FBAHelpers.fbaHelpers.LoginAnonymously();
                if (res == null) {
                  print("Error Occurred");
                } else {
                  print("Login Successfully");
                }
                Navigator.of(context).pushNamed('Home');
              },
            ),
            ElevatedButton(
              child: const Text("Register Page"),
              onPressed: () {
                Navigator.of(context).pushNamed('Register');
              },
            ),
            ElevatedButton(
              child: const Text(" Login with Email & Password"),
              onPressed: () {
                Navigator.of(context).pushNamed('Email&password');
              },
            ),
            ElevatedButton(
              child: const Text("Google Sign In"),
              onPressed: () {
                Navigator.of(context).pushNamed('Googlesignin');
              },
            ),
            ElevatedButton(
              child: const Text("Phone Number login"),
              onPressed: () {
                Navigator.of(context).pushNamed('Phonenumber');
              },
            ),
          ],
        ),
      ),
    );
  }
}
