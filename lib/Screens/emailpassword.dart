import 'package:flutter/material.dart';

import '../Helpers/auth_helpers.dart';

class Emailpasswordlogin extends StatefulWidget {
  const Emailpasswordlogin({Key? key}) : super(key: key);

  @override
  State<Emailpasswordlogin> createState() => _EmailpasswordloginState();
}

class _EmailpasswordloginState extends State<Emailpasswordlogin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login with Email & Password"),
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
                controller: email,
                onChanged : (val) {
                  setState(() {
                    email.text = val;
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
                controller: password,
                onChanged : (val) {
                  setState(() {
                    password.text = val;
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
              onPressed: () async{
                dynamic res = await FBAHelpers.fbaHelpers.loginemailpassword(email: email.text, password: password.text);
                if(res==null){
                  print("Error Occurred");
                } else {
                  Navigator.of(context).pushNamed('Home');
                  print("Login Successfully");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
