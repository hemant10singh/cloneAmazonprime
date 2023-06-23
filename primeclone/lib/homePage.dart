import 'dart:async';
import 'package:flutter/material.dart';
import 'package:primeclone/movies/action.dart';

class Homepage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
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

  int currentIndex = 0;
  Timer? timer;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    // Start automatically changing the images after some time
    startTimer();
    pageController = PageController(initialPage: currentIndex + 1);
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (pageController.hasClients) {
        if (currentIndex == imagePaths.length - 1) {
          // Reached the end, smoothly scroll to the first item
          currentIndex = 0;
          pageController.animateToPage(
            currentIndex + 1,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        } else {
          currentIndex++;
          pageController.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        }
      }
    });
  }

  void resetTimer() {
    timer?.cancel();
    startTimer();
  }

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
              );
            },
            child: Image.asset(
              'lib/assets/Amazon_Prime-Logo.wine.png',
              width: 1000,
              height: 1000,
            ),
          ),
        ),
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'All',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Movies',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              child: PageView.builder(
                //pageview builder
                itemCount: imagePaths.length + 2,
                controller: pageController,
                itemBuilder: (context, index) {
                  final actualIndex =
                      (index - 1 + imagePaths.length) % (imagePaths.length);
                  return GestureDetector(
                    onTap: () {
                      print('Button clicked!');
                      if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => movie1()),
                        );
                      } else if (index == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => movie2()),
                        );
                      } else if (index == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => movie3()),
                        );
                      } else if (index == 4) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => movie4()),
                        );
                      } else if (index == 5) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => movie5()),
                        );
                      } else if (index == 6) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => movie6()),
                        );
                      } else if (index == 7) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => movie7()),
                        );
                      } else if (index == 8) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => movie8()),
                        );
                      }
                    },
                    child: Container(
                      // margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset(
                        imagePaths[actualIndex],
                        //  fit: BoxFit.contain,
                        fit: BoxFit.cover,
                       alignment: Alignment(0, 0.6),
                      ),
                    ),
                  );
                },
                onPageChanged: (int index) {
                  setState(() {
                    if (index == 0) {
                      // Reached the beginning, jump to the last item
                      currentIndex = imagePaths.length - 1;
                      // pageController.jumpToPage(imagePaths.length);
                      pageController.animateToPage(
                        imagePaths.length,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    } else if (index == imagePaths.length + 1) {
                      // Reached the end, jump to the first item
                      currentIndex = 0;
                      // pageController.jumpToPage(1);
                      pageController.animateToPage(
                        1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    } else {
                      currentIndex = index - 1;
                    }
                    // currentIndex = index;
                  });

                  resetTimer();
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(imagePaths.length, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index ? Colors.blue : Colors.grey,
                  ),
                );
              }),
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ' Prime- Action movies',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
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
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ' Prime- Crime movies',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
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
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ' Prime- Action and adventure movies',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
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
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ' Prime- Recommened movies',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
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
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ' Prime- Romantic movies',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
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
