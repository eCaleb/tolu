import 'package:flutter/material.dart';

class Level3a extends StatelessWidget {
  const Level3a({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(child: Text("Level 3")),
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
                  "Basic materials and tools",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color:
                        Colors.white, // This color is necessary for ShaderMask
                  ),
                ),
              ),
            ),
          ),
         const SizedBox(height: 50,),
            _buildTopicCard(
              "Materials and tools for arts and crafts",
              "You use simple things like paper, crayons, scissors, and glue to create your art. These tools help you cut, stick, and color your creations.",
            ),
            const SizedBox(height: 20),
            _buildExampleCard(
              "Example Activity",
              "Make a birthday card using paper, markers, and stickers. Cut out shapes and stick them on the card to decorate it.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopicCard(String title, String content) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              content,
              textAlign: TextAlign.center,
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

  Widget _buildExampleCard(String title, String example) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              example,
              textAlign: TextAlign.center,
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