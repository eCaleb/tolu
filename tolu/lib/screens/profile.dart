import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  final String avatarPath;
  final String userId;

  const Profile({Key? key, required this.avatarPath, required this.userId})
      : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  String _fullName = '';
  String _email = '';
  String _password = '******'; // Placeholder for password, not the actual value

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    fetchUserData();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> fetchUserData() async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .get();

      if (userDoc.exists) {
        setState(() {
          _fullName = userDoc['fullName'];
          _email = userDoc['email'];
          _password = userDoc['password'];

          // Initialize controllers with fetched data
          _fullNameController.text = _fullName;
          _emailController.text = _email;
          _passwordController.text = _password;

          print('Fetched user data: fullName=$_fullName, email=$_email,password =$_password');
        });
      } else {
        print('Document does not exist for user ID: ${widget.userId}');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> updateProfile() async {
    try {
      // Update local values immediately with text controller values
      _fullName = _fullNameController.text;
      _email = _emailController.text;
      _password = _passwordController.text; // Handle securely if necessary

      // Validate fields
      if (_fullName.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Full name is required'),
          ),
        );
        return;
      }

      if (_email.isEmpty || !_email.contains('@')) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid email address'),
          ),
        );
        return;
      }

      if (_password.isEmpty || _password.length < 8) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password must be at least 8 characters'),
          ),
        );
        return;
      }

      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      // Update email in Firebase Authentication
      // ignore: deprecated_member_use
      await user?.updateEmail(_email);

      // Update password in Firebase Authentication
      await user?.updatePassword(_password);

      // Update Firestore document
      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .update({
        'fullName': _fullName,
        'email': _email,
        'password':_password,
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully'),
        ),
      );

      // Update local UI
      setState(() {
        _fullName = _fullNameController.text;
        _email = _emailController.text;
        _password = _passwordController.text;
        _isEditing = false; // Exit edit mode
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update profile: $e'),
        ),
      );
    }
  }

  Widget _buildTextField(
      String initialValue, TextEditingController controller, String hintText) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hintText';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset("assets/images/rect.png"),
                Padding(
                  padding: const EdgeInsets.only(top: 168.0),
                  child: Center(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Image.asset(widget.avatarPath),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(Icons.person_outline,
                      color: const Color(0xFF894F3D)),
                ),
                Text(
                  "Full Name",
                  style: TextStyle(color: const Color(0xFF894F3D)),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _isEditing
                      ? _buildTextField(_fullName, _fullNameController,
                          'Enter your full name')
                      : Text(
                          _fullName.isNotEmpty
                              ? _fullName
                              : 'Enter your full name',
                          style:
                              const TextStyle(color: const Color(0xFF894F3D)),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(Icons.email_outlined,
                      color: const Color(0xFF894F3D)),
                ),
                Text(
                  "Email",
                  style: TextStyle(color: const Color(0xFF894F3D)),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _isEditing
                      ? _buildTextField(
                          _email, _emailController, 'Enter your email address')
                      : Text(
                          _email.isNotEmpty
                              ? _email
                              : 'Enter your email address',
                          style:
                              const TextStyle(color: const Color(0xFF894F3D)),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(Icons.visibility_outlined,
                      color: const Color(0xFF894F3D)),
                ),
                Text(
                  "Password:",
                  style: TextStyle(color: const Color(0xFF894F3D)),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _isEditing
                      ? _buildTextField(
                          _password, _passwordController, 'Enter your password')
                      : Text(
                          _password.isNotEmpty
                              ? _password
                              : 'Enter your password',
                          style:
                              const TextStyle(color: const Color(0xFF894F3D)),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF894F3D),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: _isEditing
                  ? () {
                      updateProfile(); // Call updateProfile function
                    }
                  : () {
                      setState(() {
                        _isEditing = true; // Enter edit mode
                      });
                    },
              child: Text(_isEditing ? 'Save' : 'Edit Profile',
                  style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
