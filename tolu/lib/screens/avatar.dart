import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tolu/classes/avatar_containers.dart';
import 'package:tolu/screens/dashboard.dart';

class SelectAvatar extends StatefulWidget {
  final String selectedAgeImage;

  const SelectAvatar({super.key, required this.selectedAgeImage});

  @override
  State<SelectAvatar> createState() => _SelectAvatarState();
}

class _SelectAvatarState extends State<SelectAvatar> {
  String _selectedAvatar = '';

  Future<void> saveUserSelections(String userId, String avatarPath, String ageImagePath) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'avatar': avatarPath,
      'ageImage': ageImagePath,
    });
  }

  void _onAvatarTap(String imagePath) {
    setState(() {
      _selectedAvatar = imagePath;
    });
  }

  void _onContinuePressed() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await saveUserSelections(user.uid, _selectedAvatar, widget.selectedAgeImage);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard(
            selectedAvatar: _selectedAvatar,
            selectedAgeImage: widget.selectedAgeImage,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      body: Stack(
        children: [
          Image.asset("assets/images/curls.png"),
          Padding(
            padding: const EdgeInsets.only(top: 65.0, left: 50.0),
            child: Image.asset("assets/images/3rd student filled.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 208.0, left: 90.0),
            child: Container(
              height: 80,
              width: 190,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2, color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Center(
                  child: Text(
                    "Choose your avatar",
                    style: TextStyle(
                      color: Color.fromARGB(255, 149, 77, 51),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 607.4),
            child: Image.asset("assets/images/bottom curls.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 325.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AvatarContainer(
                      imagePath: "assets/images/lion.png",
                      isSelected: _selectedAvatar == "assets/images/lion.png",
                      onTap: () => _onAvatarTap("assets/images/lion.png"),
                    ),
                    AvatarContainer(
                      imagePath: "assets/images/tiger.png",
                      isSelected: _selectedAvatar == "assets/images/tiger.png",
                      onTap: () => _onAvatarTap("assets/images/tiger.png"),
                    ),
                    AvatarContainer(
                      imagePath: "assets/images/elephant.png",
                      isSelected: _selectedAvatar == "assets/images/elephant.png",
                      onTap: () => _onAvatarTap("assets/images/elephant.png"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AvatarContainer(
                      imagePath: "assets/images/croc.png",
                      isSelected: _selectedAvatar == "assets/images/croc.png",
                      onTap: () => _onAvatarTap("assets/images/croc.png"),
                    ),
                    AvatarContainer(
                      imagePath: "assets/images/chicken.png",
                      isSelected: _selectedAvatar == "assets/images/chicken.png",
                      onTap: () => _onAvatarTap("assets/images/chicken.png"),
                    ),
                    AvatarContainer(
                      imagePath: "assets/images/snake.png",
                      isSelected: _selectedAvatar == "assets/images/snake.png",
                      onTap: () => _onAvatarTap("assets/images/snake.png"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AvatarContainer(
                      imagePath: "assets/images/penguin.png",
                      isSelected: _selectedAvatar == "assets/images/penguin.png",
                      onTap: () => _onAvatarTap("assets/images/penguin.png"),
                    ),
                    AvatarContainer(
                      imagePath: "assets/images/bear.png",
                      isSelected: _selectedAvatar == "assets/images/bear.png",
                      onTap: () => _onAvatarTap("assets/images/bear.png"),
                    ),
                    AvatarContainer(
                      imagePath: "assets/images/tortoise.png",
                      isSelected: _selectedAvatar == "assets/images/tortoise.png",
                      onTap: () => _onAvatarTap("assets/images/tortoise.png"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (_selectedAvatar.isNotEmpty)
            Positioned(
              bottom: 20,
              right: 20,
              child: ElevatedButton(
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
            ),
        ],
      ),
    );
  }
}
