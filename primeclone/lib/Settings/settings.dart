import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primeclone/Settings/settingsPages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Authentication/login.dart';
import '../Authentication/splashScreen.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool autoplayEnabled = false;
  bool allowNotifications = false;
   @override
    void initState() {
    super.initState();
    // Retrieve notification settings when the widget is initialized
    retrieveNotificationSettings();
    retrieveLanguageSettings();
  }

  Future<void> retrieveNotificationSettings() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final notificationsRef = FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('notification details')
            .doc(user.uid);

        final snapshot = await notificationsRef.get();
        if (snapshot.exists) {
          final data = snapshot.data() as Map<String, dynamic>;
          setState(() {
            allowNotifications = data['allowNotifications'] == 'On';
          });
        }
      }
    } catch (e) {
      print('Error retrieving notification settings: $e');
    }
  }
 String selectedLanguage = '';
Future<void> retrieveLanguageSettings() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final notificationsRef = FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('Language details')
            .doc(user.uid);

        final snapshot = await notificationsRef.get();
        if (snapshot.exists) {
          final data = snapshot.data() as Map<String, dynamic>;
          setState(() {
            selectedLanguage = data['Language'];
           
          });
        }
      }
    } catch (e) {
      print('Error retrieving notification settings: $e');
    }
  }

  

  final users = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 20, 36),
        centerTitle: false,
        title: Text(
          'Settings',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 25),
        ),
        automaticallyImplyLeading: false, //to remove the back button
      ),
      backgroundColor: Color.fromARGB(255, 2, 20, 36),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Beta',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              subtitle: Text(
                'Thanks for helping us with this beta\nversion of the app. To leave the beta\nprogram, tap here to go the Google Play\nTest Track site whre you can opt out.',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Stream & download',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              subtitle: Text(
                'Manage quality and Wi-Fi',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Notifications',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              subtitle: Text(
                allowNotifications ? 'On' : 'Off',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Notifications()));
              },
            ),
            ListTile(
              title: Text(
                'Autoplay',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              subtitle: Text(
                'Play the next episode automatically',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              trailing: Switch(
                value: autoplayEnabled,
                onChanged: (value) {
                  setState(() {
                    autoplayEnabled = value;
                  });
                },
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Parental Controls',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              subtitle: Text(
                'Control what you can watch',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Registered devices',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              subtitle: Text(
                'See all registerd devices',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Clear video search history',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Signed in as ${users?.email}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              subtitle: Text(
                'Sign out of all Amazon apps',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                var prefs= await SharedPreferences.getInstance();
                prefs.setBool(SplashScreenState.KEYLOGIN, false);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Membership and subscriptions',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              subtitle: Text(
                'Manage your subscriptions',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Hidden videos',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Language',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              subtitle: Text(
                selectedLanguage,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              onTap: () {
                 Navigator.push(context,MaterialPageRoute(builder: (context) => Languages()));
              },
            ),
            ListTile(
              title: Text(
                'Help & Feedback',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'About & Legal',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
