import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Phonesignin extends StatefulWidget {
  const Phonesignin({Key? key}) : super(key: key);

  @override
  State<Phonesignin> createState() => _PhonesigninState();
}

class _PhonesigninState extends State<Phonesignin> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String IDrecevid = " ";
  bool otpvisible = false;
  TextEditingController phone = TextEditingController();
  TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login with Phone Number"),
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
                keyboardType: TextInputType.phone,
                controller: phone,
                onChanged: (val) {
                  setState(() {
                    phone.text = val;
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                  hintText: "Enter phone number .. !!",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: otpvisible,
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: 340,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: otp,
                  onChanged: (val) {
                    setState(() {
                      otp.text = val;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.security,
                      color: Colors.grey,
                    ),
                    hintText: "Enter OTP .. !!",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: Text(otpvisible == true ? "Login" : "Verify"),
              onPressed: () {
                if (otpvisible) {
                  VerifyOTP();
                } else {
                  Verifynumber();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void Verifynumber() {
    firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await firebaseAuth.signInWithCredential(credential).then((value) {
          print("Login Successfully");
        });
      },
      verificationFailed: (FirebaseAuthException exception) {
        print(exception.message);
      },
      codeSent: (String VerificationId, int? resendTokan) {
        IDrecevid = VerificationId;
        otpvisible = true;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String VerificationId) {},
    );
  }

  void VerifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: IDrecevid, smsCode: otp.text);
    await firebaseAuth.signInWithCredential(credential).then((value){
      print("Login Successfully");
    });
  }
}
