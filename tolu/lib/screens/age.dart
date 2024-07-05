import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tolu/classes/container.dart';
import 'package:tolu/screens/avatar.dart';

class AgePicker extends StatefulWidget {
  const AgePicker({super.key});

  @override
  State<AgePicker> createState() => _AgePickerState();
}

class _AgePickerState extends State<AgePicker> {
  String _selectedAgeImage = '';

  Future<void> saveUserAgeSelection(String userId, String ageImagePath) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'ageImage': ageImagePath,
    });
  }

  void _onContainerTap(String imagePath) {
    setState(() {
      _selectedAgeImage = imagePath;
    });
  }

  void _onContinuePressed() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await saveUserAgeSelection(user.uid, _selectedAgeImage);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectAvatar(
            selectedAgeImage: _selectedAgeImage,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/images/curls.png"),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 135.0,
                  left: 50,
                ),
                child: Image.asset("assets/images/third student.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 607.4),
                child: Image.asset("assets/images/bottom curls.png"),
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 378.0),
                        child: CustomContainer(
                          imagePath: "assets/images/5.png",
                          color: const Color(0xFF0EDB16),
                          onTap: () => _onContainerTap('assets/images/5.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 378.0),
                        child: CustomContainer(
                          imagePath: "assets/images/6.png",
                          color: const Color(0xFF0C4FFA),
                          onTap: () => _onContainerTap('assets/images/6.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 378.0),
                        child: CustomContainer(
                          imagePath: "assets/images/7.png",
                          color: const Color(0xFFFD0B0B),
                          onTap: () => _onContainerTap('assets/images/7.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 378.0),
                        child: CustomContainer(
                          imagePath: "assets/images/8.png",
                          color: const Color(0xFFEB0CFE),
                          onTap: () => _onContainerTap('assets/images/8.png'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (_selectedAgeImage.isNotEmpty)
                    Column(
                      children: [
                        const Text(
                          'Wonderful! You selected your age',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _onContinuePressed,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color.fromARGB(255, 149, 77, 51), // Foreground color
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
