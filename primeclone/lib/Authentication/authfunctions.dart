import 'package:firebase_auth/firebase_auth.dart';
import 'package:primeclone/Authentication/firbaseFunctions.dart';

class AuthServices {
  static signup(String email, String password, String fullname) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseAuth.instance.currentUser!.updateDisplayName(fullname);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      await FirebaseServices.saveUser(fullname, email,credential.user!.uid);
      print("Registration Successful");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  static signin(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("Success");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
