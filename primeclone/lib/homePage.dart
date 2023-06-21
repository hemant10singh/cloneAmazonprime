import 'package:flutter/material.dart';


class Homepage extends StatefulWidget {
  @override

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Color.fromARGB(255, 1, 10, 18), 
  elevation: 0, 
  
  leading: Padding(
    padding: EdgeInsets.all(0.0),
    child: GestureDetector(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => Homepage()),);
            },
    child: Image.asset(
      'lib/assets/Amazon_Prime-Logo.wine.png', 
      width: 1000,
      height:1000,
    ),
  ),
  ),
  // leading: Row(
  //   children: [
  //     SizedBox(width: 8.0),
  //     Expanded(
  //       flex: 1,
  //       child: Container(
  //         alignment: Alignment.centerLeft,
  //         child: Image.asset(
  //           'lib/assets/prime-video-1.png',
  //           width: 1000,
  //           height: 1000,
  //         ),
  //       ),
  //     ),
  //   ],
  // ),
  
  // flexibleSpace: FlexibleSpaceBar(
  //    centerTitle: false,
  //   title: Align(
  //     alignment: Alignment.centerLeft,
  //     child: Padding(
  //       padding: EdgeInsets.all(0.0),
  //       child: Image.asset(
  //         'lib/assets/prime-video-1.png',
  //         width: 80,
  //         height: 80,
  //       ),
  //     ),
  //   ),
  // ),
  actions: [
    IconButton(
      onPressed: () {
      
      },
      icon: Icon(
        Icons.account_circle,
        color: Colors.white,
        size: 40,
      ),
    ),
  ],
  bottom: PreferredSize(
    preferredSize: Size.fromHeight(50.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            
          },
          child: Text(
            'All',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
           
          },
          child: Text(
            'Movies',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            
          },
          child: Text(
            'TV shows',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
            ),
          ),
        ),
      ],
    ),
  ),
),

      backgroundColor: Color.fromARGB(255, 1, 10, 18),
      // body: SingleChildScrollView(
        
      // ),
      
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 1, 10, 18), 
        padding: EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
        height: 70.0, // Set the height of the footer
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // Add your home button logic here
                  },
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),
                ),
              ],
            ),
            Column(             //for both Text and icon in a a single column
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    //  store button logic here
                  },
                  icon: Icon(
                    Icons.store,
                    color: Colors.white,
                    
                  ),
                ),
                Text(
                  'Store',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    //  live TV button logic here
                  },
                  icon: Icon(
                    Icons.tv,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Live TV',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // downloads button logic here
                  },
                  icon: Icon(
                    Icons.download,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Downloads',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    //  find button logic here
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Find',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }  
}
