import 'package:flutter/material.dart';
import 'package:primeclone/homePage.dart';

List<String> imagePaths = [
  'lib/assets/movie1.jpg',
  'lib/assets/movie2.jpg',
  'lib/assets/movie3.webp',
  'lib/assets/movie4.jpg',
  'lib/assets/movie5.jpg',
  'lib/assets/movie6.jpg',
  'lib/assets/movie7.jpg',
  'lib/assets/movie8.webp',
];

class movie1 extends StatefulWidget {
  @override
  State<movie1> createState() => _movie1State();
}

class _movie1State extends State<movie1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 10, 18),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 1, 10, 18),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                imagePaths[0],
                //  fit: BoxFit.contain,
                fit: BoxFit.cover,
                alignment: Alignment(0, -1),
              ),
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
                child: Text(
                  'Captain America',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_box_rounded,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'watch with a Prime membership',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 386,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button 1 press
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Adjust the border radius value as needed
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 63, 84, 96)),
                ),
                child: Text(
                  'Watch with Prime',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              width: 386,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button 2 press
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Adjust the border radius value as needed
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 63, 84, 96)),
                ),
                child: Text(
                  'Rent movie HD ₹70',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              width: 386,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button 3 press
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Adjust the border radius value as needed
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 63, 84, 96)),
                ),
                child: Text(
                  'More purchase options',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 7.0, horizontal: 13.0),
                child: Text(
                  'Rentals include 30 days to start watching this video and 48 hours to finish once started.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 1, 10, 18),
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0), // Add horizontal padding
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
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Watchlist',
                        style: TextStyle(color: Colors.white, fontSize: 15),
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
                          Icons.movie,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Watch Party',
                        style: TextStyle(color: Colors.white, fontSize: 15),
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
                          Icons.share,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Share',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 7.0, horizontal: 13.0),
                child: Text(
                  'After being injected with a special "Super-Soldier" serum which leads to him developing superpowers Steve must thwart the plans of a warmonger.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
             SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                 padding:
                    const EdgeInsets.symmetric(vertical: 7.0, horizontal: 13.0),
                child: Text(
                  ' Customers also watched',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 6),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print('Button clicked!');
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => movie1()),
                        );
                      } else if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => movie2()),
                        );
                      } else if (index == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => movie3()),
                        );
                      } else if (index == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => movie4()),
                        );
                      } else if (index == 4) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => movie5()),
                        );
                      } else if (index == 5) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => movie6()),
                        );
                      } else if (index == 6) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => movie7()),
                        );
                      } else if (index == 7) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => movie8()),
                        );
                      }
                    },
                    child: Container(
                      width: 210,
                      margin:
                          EdgeInsets.only(left: index == 0 ? 8 : 0, right: 15),
                      child: Image.asset(
                        imagePaths[index],
                        //  fit: BoxFit.contain,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),

      ),
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 1, 10, 18),
        padding:
            EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  },
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Home',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
            Column(
              //for both Text and icon in a a single column
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
                  style: TextStyle(color: Colors.white, fontSize: 15),
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
                  style: TextStyle(color: Colors.white, fontSize: 15),
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
                  style: TextStyle(color: Colors.white, fontSize: 15),
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
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class movie2 extends StatefulWidget {
  @override
  State<movie2> createState() => _movie2State();
}

class _movie2State extends State<movie2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: Text('This is Page 2'),
      ),
    );
  }
}

class movie3 extends StatefulWidget {
  @override
  State<movie3> createState() => _movie3State();
}

class _movie3State extends State<movie3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
      ),
      body: Center(
        child: Text('This is Page 3'),
      ),
    );
  }
}

class movie4 extends StatefulWidget {
  @override
  State<movie4> createState() => _movie4State();
}

class _movie4State extends State<movie4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 4'),
      ),
      body: Center(
        child: Text('This is Page 4'),
      ),
    );
  }
}

class movie5 extends StatefulWidget {
  @override
  State<movie5> createState() => _movie5State();
}

class _movie5State extends State<movie5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 5'),
      ),
      body: Center(
        child: Text('This is Page 5'),
      ),
    );
  }
}

class movie6 extends StatefulWidget {
  @override
  State<movie6> createState() => _movie6State();
}

class _movie6State extends State<movie6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 6'),
      ),
      body: Center(
        child: Text('This is Page 6'),
      ),
    );
  }
}

class movie7 extends StatefulWidget {
  @override
  State<movie7> createState() => _movie7State();
}

class _movie7State extends State<movie7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 7'),
      ),
      body: Center(
        child: Text('This is Page 7'),
      ),
    );
  }
}

class movie8 extends StatefulWidget {
  @override
  State<movie8> createState() => _movie8State();
}

class _movie8State extends State<movie8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 8'),
      ),
      body: Center(
        child: Text('This is Page 8'),
      ),
    );
  }
}
