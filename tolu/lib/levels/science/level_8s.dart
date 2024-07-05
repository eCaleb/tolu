import 'package:flutter/material.dart';

class Level8s extends StatelessWidget {
  const Level8s({Key? key}) : super(key: key);

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
                    "Earth and Space",
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
            _buildScienceCard(
              "Earth's Surface",
              "Earth has land and water. The land has mountains, forests, and deserts. The oceans have fish, whales, and sharks.",
            ),
            const SizedBox(height: 20),
            _buildScienceCard(
              "Space Exploration",
              "Space is where stars and planets are. Astronauts use rockets to explore space and learn about planets like Mars and Jupiter.",
            ),
            const SizedBox(height: 20),
            _buildScienceCard(
              "The Solar System",
              "Our solar system has eight planets that go around the Sun. Earth is one of these planets.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScienceCard(String title, String content) {
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
}
