import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Helpers/auth_helpers.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text(
              "Login Successfully .. !!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            ElevatedButton(
              child: const Text("Sign Out"),
              onPressed: () async {
                dynamic signout = FBAHelpers.fbaHelpers.signOut();
                if(signout == null){
                  print("Error Occurred");
                } else {
                  print("Log out Successfully");
                }
                Navigator.of(context).pop('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
