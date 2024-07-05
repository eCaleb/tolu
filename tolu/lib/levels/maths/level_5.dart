import 'package:flutter/material.dart';

class Level5 extends StatelessWidget {
  const Level5({Key? key});

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
                    "Bracket",
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
            const SizedBox(height: 40),
            const Center(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: SizedBox(
                    width: 390,
                    child: Text(
                      "Brackets are used to prioritize operations, allowing you to control which calculations are performed first. For example, (5 - 2) × 3 equals 9, where the subtraction inside the parentheses is calculated first.",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "(", // Left parenthesis
                  style: TextStyle(
                    color: Color(0xFF894F3D),
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "5", // First operand (inside parentheses)
                      style: TextStyle(
                        color: Color(0xFF894F3D),
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "-", // Subtraction sign
                  style: TextStyle(
                    color: Color(0xFF894F3D),
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "2", // Second operand (inside parentheses)
                      style: TextStyle(
                        color: Color(0xFF894F3D),
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  ")", // Right parenthesis
                  style: TextStyle(
                    color: Color(0xFF894F3D),
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "×", // Multiplication sign
                  style: TextStyle(
                    color: Color(0xFF894F3D),
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "3", // Third operand (outside parentheses)
                      style: TextStyle(
                        color: Color(0xFF894F3D),
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "=", // Equal sign
                  style: TextStyle(
                    color: Color(0xFF894F3D),
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "9", // Result of operation
                      style: TextStyle(
                        color: Color(0xFF894F3D),
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
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
