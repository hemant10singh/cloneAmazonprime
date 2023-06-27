import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:primeclone/Settings/settings.dart";


class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  List<bool> isSelected = [true, false];
  //  String userName = '';
 final users= FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        backgroundColor: Color.fromARGB(255, 1, 10, 18),
        elevation: 0,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                // Handle profile button press
              },
              
              child: Row(
                children: [
                  Icon(
                    Icons.account_circle,
                    color: Colors.blue,
                    size: 38,
                  ),
                  SizedBox(width: 5.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${users?.email}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Switch profiles',
                        style: TextStyle(
                          color: Color.fromARGB(255, 179, 176, 176),
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // FirebaseAuth.instance.signOut();
              Navigator.push(context,MaterialPageRoute(builder: (context) => Settings()));
            },
            icon: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      
      backgroundColor: Color.fromARGB(255, 1, 10, 18),
      
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    // Handle "Watchlist" button press
                    setState(() {
                      isSelected = [true, false];
                    });
                  },
                  child: Text(
                    'Watchlist',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: isSelected[0] ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    // Handle "Purchases" button press
                    setState(() {
                      isSelected = [false, true];
                    });
                  },
                  child: Text(
                    'Purchases',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: isSelected[1] ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.white,
            thickness: 0.5,
            height: 2.0,
          ),
          SizedBox(height: 8.0),
          // Add your WatchlistPage or PurchasesPage content here based on the isSelected state
          if (isSelected[0]) ...[
            // Display WatchlistPage content
            Padding(
              padding: EdgeInsets.only(top: 250.0),
              child: Center(
                child: Text(
                  'Browse now, watch later',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ] else ...[
            // Display PurchasesPage content
            Padding(
             padding: EdgeInsets.only(top: 250.0),
              child: Center(
                child: Text(
                  'Rent & buy your favourites',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
