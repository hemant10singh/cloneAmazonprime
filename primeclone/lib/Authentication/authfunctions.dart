
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primeclone/Authentication/firbaseFunctions.dart';

import '../homePage.dart';

class AuthServices {
  static signup(String email, String password, String fullname,BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseAuth.instance.currentUser!.updateDisplayName(fullname);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      await FirebaseServices.saveUser(fullname, email,credential.user!.uid);
      ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text("Registration Successful")));
      print("Registration Successful");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text("The password provided is too weak.")));
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
         ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text("The account already exists for that email")));
        print('The account already exists for that email.');
      }
    } catch (e) {
       ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(e.toString())));
      print(e);
    }
  }
  static signin(String email, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
           ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text("You are logged in")));
      print("Success");
       Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Homepage()),
    );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text("No user found for that email.")));
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text("Wrong password provided for that user.")));
        print('Wrong password provided for that user.');
      }
    }
  }
}
