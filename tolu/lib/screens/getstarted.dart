import 'package:flutter/material.dart';
import 'package:tolu/screens/login.dart';
import 'package:tolu/screens/signup.dart';

class Getstarted extends StatelessWidget {
  const Getstarted({super.key});

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
                padding: const EdgeInsets.only(top: 607.4),
                child: Image.asset("assets/images/bottom curls.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 440.0,
                    left:
                        50.0), // Adjust this value to position the container under the student image
                child: Container(
                  height: 320,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 7,
                          color: const Color.fromARGB(255, 149, 77, 51)),
                      borderRadius: BorderRadius.circular(170)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Signup(),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                                color: Color.fromARGB(255, 149, 77, 51)),
                            minimumSize: const Size(200, 40)),
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                              color: Color.fromARGB(255, 149, 77, 51),
                              fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              color: Color.fromARGB(255, 149, 77, 51),
                            ),
                            minimumSize: const Size(200, 40)),
                        child: const Text(
                          "I have an account",
                          style: TextStyle(
                              color: Color.fromARGB(255, 149, 77, 51),
                              fontSize: 20),
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
    );
  }
}
