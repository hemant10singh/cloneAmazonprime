import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool allowNotifications = false;
  bool enableDownloads = false;
  bool watchlistEnabled = false;
  bool recommendedEnabled = false;
  bool appFeaturesEnabled = false;
  bool specialOffersEnabled = false;
  @override
  void initState() {
    super.initState();
    // Retrieve notification settings when the widget is initialized
    retrieveNotificationSettings();
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
            enableDownloads = data['enableDownloads'] == 'On';
            watchlistEnabled = data['watchlistEnabled'] == 'On';
            recommendedEnabled = data['recommendedEnabled'] == 'On';
            appFeaturesEnabled = data['appFeaturesEnabled'] == 'On';
            specialOffersEnabled = data['specialOffersEnabled'] == 'On';
          });
        }
      }
    } catch (e) {
      print('Error retrieving notification settings: $e');
    }
  }

  Future<void> updateNotificationSettings() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final notificationsRef = FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('notification details')
            .doc(user.uid);

        await notificationsRef.set({
          'allowNotifications': allowNotifications ? 'On' : 'Off',
          'enableDownloads': enableDownloads ? 'On' : 'Off',
          'watchlistEnabled': watchlistEnabled ? 'On' : 'Off',
          'recommendedEnabled': recommendedEnabled ? 'On' : 'Off',
          'appFeaturesEnabled': appFeaturesEnabled ? 'On' : 'Off',
          'specialOffersEnabled': specialOffersEnabled ? 'On' : 'Off',
        });
      }
    } catch (e) {
      print('Error updating notification settings: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 20, 36),
        centerTitle: false,
        title: Text(
          'Notifications',
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
              subtitle: Text(
                'Thanks for helping us with this beta\nversion of the app. To leave the beta\nprogram, tap here to go the Google Play\nTest Track site where you can opt out.',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Allow notifications',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              trailing: Switch(
                value: allowNotifications,
                onChanged: (value) async {
                  setState(() {
                    allowNotifications = value;
                    if (!allowNotifications) {
                      enableDownloads = false;
                      watchlistEnabled = false;
                      recommendedEnabled = false;
                      appFeaturesEnabled = false;
                      specialOffersEnabled = false;
                    }
                  });
                  await updateNotificationSettings();
                },
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Downloads',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              trailing: Switch(
                value: enableDownloads,
                onChanged: (value) async {
                  setState(() {
                    enableDownloads = value;
                  });
                  await updateNotificationSettings();
                },
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Your Watchlist & Library',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              trailing: Switch(
                value: watchlistEnabled,
                onChanged: (value) async {
                  setState(() {
                    watchlistEnabled = value;
                  });
                  await updateNotificationSettings();
                },
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Recommended For You',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              trailing: Switch(
                value: recommendedEnabled,
                onChanged: (value) async {
                  setState(() {
                    recommendedEnabled = value;
                  });
                  await updateNotificationSettings();
                },
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'New App Features',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              trailing: Switch(
                value: appFeaturesEnabled,
                onChanged: (value) async {
                  setState(() {
                    appFeaturesEnabled = value;
                  });
                  await updateNotificationSettings();
                },
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Special Offers',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              trailing: Switch(
                value: specialOffersEnabled,
                onChanged: (value) async {
                  setState(() {
                    specialOffersEnabled = value;
                  });
                  await updateNotificationSettings();
                },
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
 List<String> selectedLanguages = [];
class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  State<Languages> createState() => _LanguagesState();
}
  
  class _LanguagesState extends State<Languages> {
  List<String> languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Japanese',
    'Chinese',
    'Hindi',
  ];
  String selectedLanguage = '';
   @override
  void initState() {
    super.initState();
    // Retrieve notification settings when the widget is initialized
    retrieveLanguageSettings();
  }

  
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

  

  Future<void> updateLanguage() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final notificationsRef = FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('Language details')
            .doc(user.uid);
        await notificationsRef.set({
          'Language': selectedLanguage, 
        });
      }
    } catch (e) {
      print('Error updating notification settings: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 20, 36),
        centerTitle: false,
        title: Text(
          'Language',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
        automaticallyImplyLeading: false, //to remove the back button
      ),
      backgroundColor: Color.fromARGB(255, 2, 20, 36),
      body: SingleChildScrollView(
        child: Column(
          children: languages.map((language) {
            final bool isSelected = (selectedLanguage == language);
            return ListTile(
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedLanguage = language;
                  });
                },
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey),
                    color: isSelected ? Colors.blue : Colors.white,
                  ),
                  child: isSelected
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        )
                      : null,
                ),
              ),
              title: Text(
                language,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              onTap: () async{
                setState(() {
                  selectedLanguage = language;
                });
                updateLanguage();
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

