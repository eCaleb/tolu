import 'package:flutter/material.dart';

class Level9a extends StatelessWidget {
  const Level9a({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(child: Text("Level 9")),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical:10),
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
                  "Understanding art styles",
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
              "Understanding Art Styles",
              "Art styles are different ways of creating art. Each style has its own look and feel. Learn about some popular art styles and try them out.",
            ),
            const SizedBox(height: 20),
            _buildContentCard(
              "Realism",
              "Realism is when you try to make art look as close to real life as possible. Artists use details and colors to make their pictures look realistic.",
            ),
            const SizedBox(height: 10),
            _buildContentCard(
              "Abstract",
              "Abstract art is when you use shapes, colors, and lines to create pictures that don't look like real life. It's about expressing feelings and ideas.",
            ),
            const SizedBox(height: 10),
            _buildContentCard(
              "Impressionism",
              "Impressionism is a style that captures a moment in time, like a quick impression. Artists use light and color to create a sense of movement and time.",
            ),
            const SizedBox(height: 20),
            _buildExampleCard(
              "Example Activity: Realism Drawing",
              "Draw a picture of something you see every day, like your favorite toy or a flower. Try to make it look as real as possible by adding lots of details.",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example Activity: Abstract Painting",
              "Create an abstract painting. Use different colors and shapes to show how you're feeling today. There's no right or wrong way to do it!",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example Activity: Impressionist Landscape",
              "Paint a landscape like a park or a beach using the impressionist style. Use quick brush strokes and bright colors to capture the feeling of the place.",
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

  Widget _buildContentCard(String title, String content) {
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
