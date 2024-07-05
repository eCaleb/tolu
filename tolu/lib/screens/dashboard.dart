import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tolu/classes/container.dart';
import 'package:tolu/classes/dashbord_container.dart';
import 'package:tolu/screens/games.dart';
import 'package:tolu/screens/home.dart';
import 'package:tolu/screens/profile.dart';
import 'package:tolu/screens/quiz.dart';
import 'package:tolu/screens/subjects.dart';
import 'package:tolu/screens/videos.dart';

class Dashboard extends StatefulWidget {
  final String selectedAvatar;
  final String selectedAgeImage;

  const Dashboard({
    Key? key,
    required this.selectedAvatar,
    required this.selectedAgeImage,
  }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  late String _userId;
  late String _fullName = ''; // Define a variable to store the full name

  @override
  void initState() {
    super.initState();
    _fetchUserId(); // Fetch the user ID and full name when the widget initializes
  }

  Future<void> _fetchUserId() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _userId =
            user.uid; // Set the user ID obtained from Firebase Authentication
      });

      // Fetch the full name from Firestore
      try {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(_userId)
            .get();

        if (userDoc.exists) {
          setState(() {
            _fullName = userDoc['fullName'];
          });
        } else {
          print('Document does not exist for user ID: $_userId');
        }
      } catch (e) {
        print('Error fetching user data: $e');
      }
    } else {
      // Handle case where user is not authenticated or handle error
      print('User not authenticated');
    }
  }

  List<Widget> _widgetOptions(String avatarPath) {
    return <Widget>[
      Home(fullName: _fullName), // Pass the full name to the Home widget
      const Subject(),
      const Videos(),
      const Quiz(),
      const Games(),
      Profile(avatarPath: avatarPath, userId: _userId),
    ];
  }

  // Texts to display between CircleAvatar and CustomContainer based on navigation index
  static const List<String> _sectionTitles = [
    'Home',
    'Subjects',
    'Videos',
    'Quiz',
    'Games',
    'Profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      endDrawer: Drawer(
        backgroundColor: Color(0xFFFE8D6A),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 28,
                    child: Image.asset(widget.selectedAvatar,scale: 1.35,),
                  ),
                ),
                Text(
                  _fullName,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),

            ListTile(
              leading: const Icon(Icons.notifications,color: Colors.white,),
              title: const Text('Notifications',style: TextStyle(color: Colors.white),),
              onTap: () {
                // Handle notifications tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout,color: Colors.white,),
              title: const Text('Logout',style: TextStyle(color: Colors.white)),
              onTap: () async {
                await _logout();
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset("assets/images/curls.png"),
          Positioned(
            top: 20,
            right: 20,
            child: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 75.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashboardContainer(
                  icon: Icons.star,
                  text: "38",
                  onTap: () {},
                ),
                DashboardContainer(
                  icon: Icons.stars_sharp,
                  text: "level 5",
                  onTap: () {},
                ),
                DashboardContainer(
                  icon: Icons.local_fire_department_rounded,
                  text: "20",
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 28,
                    child: Image.asset(widget.selectedAvatar),
                  ),
                ),
                Text(
                  _sectionTitles[_selectedIndex], // Display text based on index
                  style: const TextStyle(
                    color: Color.fromARGB(255, 149, 77, 51),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomContainer(
                    imagePath: widget.selectedAgeImage,
                    color: Colors.grey,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          Center(
            child:
                _widgetOptions(widget.selectedAvatar).elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Subjects',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_collection),
              label: 'Videos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.quiz),
              label: 'Quiz',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.games),
              label: 'Games',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 149, 77, 51),
          unselectedItemColor: const Color.fromARGB(255, 149, 77, 51),
          onTap: _onItemTapped,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}
