import 'package:flutter/material.dart';

class Level6 extends StatelessWidget {
  const Level6({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(child: Text("LEVEL 6")),
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
                    "Fractions",
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
            const Center(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: SizedBox(
                    width: 390,
                    child: Text(
                      "Fractions represent parts of a whole or parts of a set. There are different types of fractions such as proper fractions, improper fractions, and mixed numbers.",
                      style: TextStyle(
                        color: Color(0xFF894F3D),
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w900,
                        fontSize: 17.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            _buildFractionTypeCard(
              title: "Proper Fractions",
              description:
                  "Proper fractions have a numerator (top number) smaller than the denominator (bottom number). For example, 1/2, 3/4, etc.",
            ),
            const SizedBox(height: 20),
            _buildFractionTypeCard(
              title: "Improper Fractions",
              description:
                  "Improper fractions have a numerator larger than or equal to the denominator. For example, 5/3, 7/4, etc.",
            ),
            const SizedBox(height: 20),
            _buildFractionTypeCard(
              title: "Mixed Numbers",
              description:
                  "Mixed numbers consist of a whole number and a proper fraction. For example, 1 1/2, 2 3/4, etc.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFractionTypeCard({required String title, required String description}) {
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
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF894F3D),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF894F3D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
