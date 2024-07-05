import 'package:flutter/material.dart';
import 'package:tolu/screens/getstarted.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset("assets/images/curls.png"),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Image.asset("assets/images/eduplay.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 300.0),
                  child: Center(
                      child: Image.asset(
                    "assets/images/first student.png",
                    height: 300,
                  )),
                ),
                   const Padding(
                  padding: EdgeInsets.only(top:330.0,left: 193),
                  child: Text("Let's Get Started",style: TextStyle(fontSize: 15,fontWeight:FontWeight.w800,color: Color(0xFF894F3D)),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 607.4),
                  child: Image.asset("assets/images/bottom curls.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 680.0, left: 110.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Getstarted(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 149, 77, 51)),
                      child: const Text(
                        "WELCOME",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
