import 'package:flutter/material.dart';

class Level7a extends StatelessWidget {
  const Level7a({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(child: Text("Level 7")),
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
                  "Creating 3D crafts",
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
              "Creating 3D Crafts",
              "3D crafts are objects you can make that have height, width, and depth, like a paper boat or a clay animal.",
            ),
            const SizedBox(height: 20),
            _buildContentCard(
              "Using Different Materials",
              "You can make 3D crafts using different materials like paper, clay, and cardboard. Each material can be shaped and decorated in different ways.",
            ),
            const SizedBox(height: 10),
            _buildContentCard(
              "Building and Assembling",
              "Learn how to build and assemble your crafts by following step-by-step instructions. This can include folding, cutting, and gluing pieces together.",
            ),
            const SizedBox(height: 20),
            _buildExampleCard(
              "Example Activity: Paper Boat",
              "Make a simple paper boat. Fold a piece of paper following the steps to create a boat that can float on water.",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example Activity: Clay Animal",
              "Make a clay animal. Shape the clay into your favorite animal and use tools to add details like eyes and fur.",
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
