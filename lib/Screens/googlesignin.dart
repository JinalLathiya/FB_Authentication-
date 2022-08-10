import 'package:firebase_authen/Helpers/auth_helpers.dart';
import 'package:flutter/material.dart';

class Googlesignin extends StatefulWidget {
  const Googlesignin({Key? key}) : super(key: key);

  @override
  State<Googlesignin> createState() => _GooglesigninState();
}

class _GooglesigninState extends State<Googlesignin> {
  TextEditingController Gemail = TextEditingController();
  TextEditingController Gpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in with Google"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 340,
              child: TextField(
                controller: Gemail,
                onChanged: (val) {
                  setState(() {
                    Gemail.text = val;
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email_rounded,
                    color: Colors.grey,
                  ),
                  hintText: "Enter Email .. !!",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 340,
              child: TextField(
                controller: Gpassword,
                onChanged: (val) {
                  setState(() {
                    Gpassword.text = val;
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.remove_red_eye_sharp,
                    color: Colors.grey,
                  ),
                  hintText: "Enter Password .. !!",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                child: const Text("Sign In"),
                onPressed: () async {
                  dynamic res = await FBAHelpers.fbaHelpers.SigninwithGoogle();
                  if (res == null) {
                    print("Error Occurred");
                  } else {
                    Navigator.of(context).pushNamed('Home');
                    print("Login Successfully");
                  }
                }),
          ],
        ),
      ),
    );
  }
}
