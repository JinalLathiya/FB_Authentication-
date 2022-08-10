import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FBAHelpers {
  FBAHelpers._fb();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static GoogleSignIn googleSignIn = GoogleSignIn();
  static final FBAHelpers fbaHelpers = FBAHelpers._fb();

  Future<String> LoginAnonymously() async {
    try {
      UserCredential userCredential = await firebaseAuth.signInAnonymously();
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'operation-not-allowed') {
        return "Your Account is disabled..!!";
      } else {
        return "Unknown Error";
      }
    }
  }

  Future<String> registeremailpassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'operation-not-allowed') {
        return "Operation-not-allowed";
      } else if (e.code == 'weak-password') {
        return "Weak password";
      } else if (e.code == 'email-already-in-use') {
        return "Email already in use";
      } else {
        return "Unknown Error";
      }
    }
  }

  Future<String> loginemailpassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "User-not-found";
      } else if (e.code == 'wrong-password') {
        return "Wrong password";
      } else if (e.code == 'user-disabled') {
        return "User disabled";
      } else {
        return "Unknown Error";
      }
    }
  }

  Future<User?> SigninwithGoogle() async {
    dynamic googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
        await firebaseAuth.signInWithCredential(credential);
    return userCredential.user;
  }

  Future signOut() async {
    try {
      return await firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future GsignOut() async {
    try {
      return await googleSignIn.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
