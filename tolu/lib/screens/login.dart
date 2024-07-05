import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tolu/screens/age.dart';
import 'package:tolu/screens/dashboard.dart'; // Import your Dashboard screen

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Add Firestore instance
  final _formKey = GlobalKey<FormState>();
  String _emailError = '';
  String _passwordError = '';

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        User? user = userCredential.user;

        if (user != null && user.emailVerified) {
          DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();

          if (userDoc.exists) {
            if (userDoc.data() != null) {
              Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
              if (userData.containsKey('avatar') && userData.containsKey('ageImage') ) {
                String? avatarPath = userData['avatar'];
                String? ageImagePath = userData['ageImage'];

                if (avatarPath != null && ageImagePath != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard(
                      selectedAvatar: avatarPath, 
                      selectedAgeImage: ageImagePath,
                    )),
                  );
                } 
              } else{
                // 'avatar' field does not exist in the document
                // Handle the case where avatar information is missing
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AgePicker()),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('User document does not exist.'),
                ),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('User document does not exist.'),
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please verify your email first.'),
            ),
          );
        }
      } on FirebaseAuthException catch (e) {
        String message;
        switch (e.code) {
          case 'user-not-found':
            message = 'No user found for that email.';
            break;
          case 'wrong-password':
            message = 'Wrong password provided.';
            break;
          default:
            message = 'Invalid credentials, please try again.';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );
      }
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        _emailError = 'Please enter an email';
      });
      return '';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      setState(() {
        _emailError = 'Please enter a valid email address';
      });
      return '';
    }
    setState(() {
      _emailError = '';
    });
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        _passwordError = 'Please enter a password';
      });
      return '';
    }
    setState(() {
      _passwordError = '';
    });
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset("assets/images/curls.png"),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Padding(
                    padding: _passwordError.isNotEmpty ? const EdgeInsets.only(top: 679.4) : const EdgeInsets.only(top: 645.4),
                    child: Image.asset("assets/images/bottom curls.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 440.0,
                      left: 50.0,
                    ),
                    child: Container(
                      height: 380,
                      width: 320,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 7,
                          color: const Color.fromARGB(255, 149, 77, 51),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 50),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'Email',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                height: 50,
                                width: 280,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 210, 209, 209),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter your email',
                                    contentPadding: EdgeInsets.only(left: 10.0),
                                  ),
                                  validator: _validateEmail,
                                ),
                              ),
                              if (_emailError.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    _emailError,
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'Password',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                padding: _passwordError.isNotEmpty ? const EdgeInsets.only(top: 28) : const EdgeInsets.symmetric(horizontal: 10),
                                height: 50,
                                width: 280,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 210, 209, 209),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextFormField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter your password',
                                    contentPadding: const EdgeInsets.only(left: 10.0, top: 13.5),
                                    suffixIcon: IconButton(
                                      padding: _passwordError.isNotEmpty ? const EdgeInsets.only(bottom: 36) : const EdgeInsets.all(8.0),
                                      icon: Icon(
                                        _obscureText ? Icons.visibility_off : Icons.visibility,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                    ),
                                  ),
                                  obscureText: _obscureText,
                                  validator: _validatePassword,
                                ),
                              ),
                              if (_passwordError.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    _passwordError,
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: _passwordError.isNotEmpty ? const EdgeInsets.only(top: 728.0, left: 40.0) : const EdgeInsets.only(top: 688.0, left: 40.0),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color.fromARGB(255, 149, 77, 51),
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 165.0),
                    child: Center(
                      child: Image.asset(
                        "assets/images/second student.png",
                        height: 300,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
