import 'package:flutter/material.dart';
import 'package:tolu/classes/arts_container.dart';
import 'package:tolu/classes/english_container.dart';
import 'package:tolu/classes/maths_container.dart';
import 'package:tolu/classes/maths_full_container.dart';
import 'package:tolu/classes/science_container.dart';
import 'package:tolu/levels/arts/level_1a.dart';
import 'package:tolu/levels/arts/level_2a.dart';
import 'package:tolu/levels/arts/level_3a.dart';
import 'package:tolu/levels/arts/level_4a.dart';
import 'package:tolu/levels/arts/level_5a.dart';
import 'package:tolu/levels/arts/level_6a.dart';
import 'package:tolu/levels/arts/level_7a.dart';
import 'package:tolu/levels/arts/level_8a.dart';
import 'package:tolu/levels/arts/level_9a.dart';
import 'package:tolu/levels/english/level_1e.dart';
import 'package:tolu/levels/english/level_2e.dart';
import 'package:tolu/levels/english/level_3e.dart';
import 'package:tolu/levels/english/level_4e.dart';
import 'package:tolu/levels/english/level_5e.dart';
import 'package:tolu/levels/english/level_6e.dart';
import 'package:tolu/levels/english/level_7e.dart';
import 'package:tolu/levels/english/level_8e.dart';
import 'package:tolu/levels/english/level_9e.dart';
import 'package:tolu/levels/maths/level_1.dart';
import 'package:tolu/levels/maths/level_2.dart';
import 'package:tolu/levels/maths/level_3.dart';
import 'package:tolu/levels/maths/level_4.dart';
import 'package:tolu/levels/maths/level_5.dart';
import 'package:tolu/levels/maths/level_6.dart';
import 'package:tolu/levels/maths/level_7.dart';
import 'package:tolu/levels/maths/level_8.dart';
import 'package:tolu/levels/maths/level_9.dart';
import 'package:tolu/levels/science/level_1s.dart';
import 'package:tolu/levels/science/level_2s.dart';
import 'package:tolu/levels/science/level_3s.dart';
import 'package:tolu/levels/science/level_4s.dart';
import 'package:tolu/levels/science/level_5s.dart';
import 'package:tolu/levels/science/level_6s.dart';
import 'package:tolu/levels/science/level_7s.dart';
import 'package:tolu/levels/science/level_8s.dart';
import 'package:tolu/levels/science/level_9s.dart';


class Subject extends StatefulWidget {
  const Subject({super.key});

  @override
  State<Subject> createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  void _navigateToSection(BuildContext context, String sectionName) {
    Widget sectionPage;
    switch (sectionName) {
      case 'English':
        sectionPage = English(sectionName: sectionName);
        break;
      case 'Maths':
        sectionPage = Maths(sectionName: sectionName);
        break;
      case 'Science':
        sectionPage = Science(sectionName: sectionName);
        break;
      case 'Arts':
        sectionPage = Arts(sectionName: sectionName);
        break;
      default:
        sectionPage = Science(sectionName: sectionName); // Default case
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => sectionPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 268.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => _navigateToSection(context, 'English'),
                      child: Image.asset(
                        "assets/images/Group 45.png",
                        scale: 4,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _navigateToSection(context, 'Maths'),
                      child: Image.asset(
                        "assets/images/Group 46.png",
                        scale: 4,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => _navigateToSection(context, 'Science'),
                      child: Image.asset(
                        "assets/images/Group 47.png",
                        scale: 4,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _navigateToSection(context, 'Arts'),
                      child: Image.asset(
                        "assets/images/Group 48.png",
                        scale: 4,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class English extends StatelessWidget {
  final String sectionName;

  const English({super.key, required this.sectionName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(sectionName),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: Column(
          children: [
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  EnglishContainer(text: "LEVEL 1", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const FirstLevel()))),
                  EnglishContainer(text: "LEVEL 2", onTap: ()  => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level2e())),),
                  EnglishContainer(text: "LEVEL 3", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level3e())),),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EnglishContainer(text: "LEVEL 4", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level4e())),),
                EnglishContainer(text: "LEVEL 5", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level5e())),),
                EnglishContainer(text: "LEVEL 6", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level6e())),),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EnglishContainer(text: "LEVEL 7", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level7e())),),
                EnglishContainer(text: "LEVEL 8", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level8e())),),
                GestureDetector(
                  onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level9e())),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 90,
                      width: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE75B5B),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 65.0),
                            child: Icon(Icons.star_half, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Container(
                            height: 20,
                            width: 130,
                            color: const Color(0xFFF8BFBF),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 40,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFD31515),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 19.8,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFE75B5B),
                                        borderRadius: BorderRadius.circular(6)),
                                    child: const Center(
                                      child: Text(
                                        "LEVEL 9",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Maths extends StatelessWidget {
  final String sectionName;

  const Maths({super.key, required this.sectionName,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(sectionName),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: Column(
          children: [
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MathsContainer(text: "LEVEL 1", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const MathsLevel())),),
                  MathsContainer(text: "LEVEL 2", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level2())),),
                  MathsContainer(text: "LEVEL 3", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level3())),),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MathsNot(text: "LEVEL 4", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level4())),),
                MathsNot(text: "LEVEL 5", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level5())),),
                MathsNot(text: "LEVEL 6", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level6())),),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MathsNot(text: "LEVEL 7", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level7())),),
                MathsNot(text: "LEVEL 8", onTap: ()  => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level8())),),
                MathsNot(text: "LEVEL 9", onTap: ()  => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level9())),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Science extends StatelessWidget {
  final String sectionName;

  const Science({super.key, required this.sectionName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(sectionName),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: Column(
          children: [
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ScienceContainer(text: "LEVEL 1", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const ScienceLevel())),),
                  ScienceContainer(text: "LEVEL 2", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level2s())),),
                  ScienceContainer(text: "LEVEL 3", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level3s())),),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScienceContainer(text: "LEVEL 4", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level4s())),),
                ScienceContainer(text: "LEVEL 5", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level5s())),),
                ScienceContainer(text: "LEVEL 6", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level6s())),),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScienceContainer(text: "LEVEL 7", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level7s())),),
                ScienceContainer(text: "LEVEL 8", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level8s())),),
                ScienceContainer(text: "LEVEL 9", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level9s())),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Arts extends StatelessWidget {
  final String sectionName;

  const Arts({super.key, required this.sectionName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(sectionName),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: Column(
          children: [
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ArtsContainer(text: "LEVEL 1", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const ArtsLevel())),),
                  ArtsContainer(text: "LEVEL 2", onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level2a())),),
                  ArtsContainer(text: "LEVEL 3", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level3a())),),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ArtsContainer(text: "LEVEL 4", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level4a())),),
                ArtsContainer(text: "LEVEL 5", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level5a())),),
                ArtsContainer(text: "LEVEL 6", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level6a())),),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ArtsContainer(text: "LEVEL 7", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level7a())),),
                ArtsContainer(text: "LEVEL 8", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level8a())),),
                ArtsContainer(text: "LEVEL 9", onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> const Level9a())),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
