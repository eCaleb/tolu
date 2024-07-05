import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tolu/screens/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String _emailError = '';
  String _passwordError = '';

  Future<void> _saveUserDetails(User user) async {
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'fullName': _fullNameController.text,
      'email': user.email,
      'password':_passwordController.text,
      // Add more fields here if needed
    });
  }

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        User? user = userCredential.user;

        if (user != null) {
          await _saveUserDetails(user);
          
          if (!user.emailVerified) {
            await user.sendEmailVerification();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Verification email sent to ${user.email}'),
              ),
            );
          }

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }
      } on FirebaseAuthException catch (e) {
        String message;
        switch (e.code) {
          case 'email-already-in-use':
            message = 'The email is already in use by another account.';
            break;
          case 'invalid-email':
            message = 'The email address is not valid.';
            break;
          case 'weak-password':
            message = 'The password is too weak.';
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

  String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    return null;
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
    if (value.length < 6) {
      setState(() {
        _passwordError = 'Password must be at least 6 characters long';
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
                    padding: _passwordError.isNotEmpty
                        ? const EdgeInsets.only(top: 789.4)
                        : const EdgeInsets.only(top: 770.4),
                    child: Image.asset("assets/images/bottom curls.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 425.0,
                      left: 50.0,
                    ),
                    child: Container(
                      height: 520,
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
                          const SizedBox(height: 70),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'Full Name',
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
                                  controller: _fullNameController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter your full name',
                                    contentPadding: EdgeInsets.only(left: 10.0),
                                  ),
                                  validator: _validateFullName,
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
                                padding: _passwordError.isNotEmpty
                                    ? EdgeInsets.only(top: 28)
                                    : EdgeInsets.symmetric(horizontal: 10),
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
                                    contentPadding: const EdgeInsets.only(left: 10.0, top: 13),
                                    suffixIcon: IconButton(
                                      padding: _passwordError.isNotEmpty
                                          ? EdgeInsets.only(bottom: 36)
                                          : EdgeInsets.all(8.0),
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
                          const SizedBox(height: 30),
                          Center(
                            child: ElevatedButton(
                              onPressed: _signUp,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: const Color.fromARGB(255, 149, 77, 51),
                                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
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
