import 'package:flutter/material.dart';

import '../Helpers/auth_helpers.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController email1 = TextEditingController();
  TextEditingController password1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 340,
              child: TextField(
                controller: email1,
                onChanged: (val) {
                  setState(() {
                    email1.text = val;
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
                controller: password1,
                onChanged: (val) {
                  setState(() {
                    password1.text = val;
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
              child: const Text("Register"),
              onPressed: () async {
                dynamic res = await FBAHelpers.fbaHelpers.registeremailpassword(
                    email: email1.text, password: password1.text);
                if (res == null) {
                  print("Error Occurred");
                } else {
                  Navigator.of(context).pushNamed('Home');

                  print("Register user");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
