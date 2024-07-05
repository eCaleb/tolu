import 'package:flutter/material.dart';

class Level8e extends StatelessWidget {
  const Level8e({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(child: Text("LEVEL 8")),
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
                    "Basic Literature Concepts",
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
            _buildLiteraryTermCard(
              "Literary Term: Theme",
              "Definition: The theme is the big idea or message in a story. It’s what the story is mostly about. Sometimes the theme is easy to see, and sometimes you have to think about what the characters do and say to find it.",
            ),
            const SizedBox(height: 10),
            _buildLiteraryTermCard(
              "Literary Term: Symbolism",
              "Definition: Symbolism is like using a picture, object, or idea to stand for something else. For example, when you see a heart, it usually means love. It's a way to show a big idea or feeling with something simple and easy to understand.",
            ),
            const SizedBox(height: 10),
            _buildLiteraryTermCard(
              "Literary Term: Foreshadowing",
              "Definition:Foreshadowing is like giving a little hint about what will happen later in a story. It's like when you see dark clouds in the sky and know it might rain soon. It helps you guess what's coming next in the story.",),
            const SizedBox(height: 10),
            _buildLiteraryTermCard(
              "Literary Term: Irony",
              "Definition: Irony is when something happens that is the opposite of what you expect. It's like when a fire station catches on fire or a cake maker's cake falls apart. It's surprising and often funny because it's the opposite of what you thought would happen.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLiteraryTermCard(String title, String definition) {
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
              definition,
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
}
