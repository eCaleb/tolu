import 'package:flutter/material.dart';

class Level5e extends StatelessWidget {
  const Level5e({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(child: Text("LEVEL 5")),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [
                      Color(0xFFB56D56),
                      Color(0xFF884D3B),
                      Color(0xFF23140F),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 28.0),
                  child: Text(
                    "Reading Comprehension",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildPassageCard(
              "Passage: The Solar System",
              "Our solar system consists of the Sun and other big objects. These objects include eight planets, their moons, dwarf planets e.t.c.",
            ),
            const SizedBox(height: 10),
            _buildQuestionCard(
              "Question 1",
              "What are some objects in our solar system?",
              "Eight planets, moons, dwarf planets, asteroids, comets, and meteoroids.",
            ),
            const SizedBox(height: 10),
            _buildQuestionCard(
              "Question 2",
              "What is the primary object in our solar system?",
              "The Sun.",
            ),
            const SizedBox(height: 10),
            _buildPassageCard(
              "Passage: Importance of Exercise",
              "Regular exercise plays a important role in maintaining physical health and makes you feel good. It reduces the risk of diseases, makes you happier, and promotes better sleep.",
            ),
            const SizedBox(height: 10),
            _buildQuestionCard(
              "Question 3",
              "What are some benefits of regular exercise?",
              "Reduces chronic disease risk, makes you happier, improves sleep.",
            ),
            const SizedBox(height: 10),
            _buildQuestionCard(
              "Question 4",
              "Why is regular exercise important?",
              "It maintains physical health and makes you feel good.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPassageCard(String title, String passageContent) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF894F3D),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              passageContent,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionCard(String questionTitle, String questionContent, String answerContent) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              questionTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF894F3D),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              questionContent,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Answer: $answerContent",
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

