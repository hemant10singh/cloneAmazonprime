import 'dart:async';
import 'package:flutter/material.dart';
import 'package:primeclone/Authentication/login.dart';
import 'package:primeclone/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = "Login";
  @override
  void initState() {
    super.initState();
    whereTogo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 32, 56),
      body: Container(
        color: Color.fromARGB(255, 4, 32, 56),
        child: Center(
          child: Image.asset(
            'lib/assets/prime-video-1.png',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }

  void whereTogo() async {
    var prefs = await SharedPreferences.getInstance();
    var isLoggedIn = prefs.getBool(KEYLOGIN);
    Timer(Duration(seconds: 2), () {
      if (isLoggedIn != null&& isLoggedIn) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Homepage()));
        }
        else{
           Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
        }
      }
      else{
         Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
      }
    });
  }
}
