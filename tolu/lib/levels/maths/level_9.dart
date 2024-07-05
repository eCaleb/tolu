import 'package:flutter/material.dart';

class Level9 extends StatelessWidget {
  const Level9({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(child: Text("HIGHEST COMMON FACTOR (HCF)")),
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
                    "Highest Common Factor (HCF)",
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
            Column(
              children: [
                _buildHcfCard(24, 36),
                const SizedBox(height: 10),
                _buildHcfCard(30, 45),
                const SizedBox(height: 10),
                _buildHcfCard(18, 27),
              ],
            ),
            const SizedBox(height: 20),
            _buildExplanation(),
          ],
        ),
      ),
    );
  }

  Widget _buildHcfCard(int num1, int num2) {
    int hcf = _calculateHcf(num1, num2);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
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
              "Numbers: $num1, $num2",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF894F3D),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "HCF: $hcf",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF894F3D),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Explanation:",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "The HCF of two numbers is the largest number that divides both of them without leaving a remainder.",
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

  Widget _buildExplanation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Finding HCF using Prime Factorization:",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF894F3D),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "1. Find the prime factors of each number.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "2. Identify common prime factors with the lowest exponent for each number.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "3. Multiply these common prime factors together to get the HCF.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Example:",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF894F3D),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Numbers: 24, 36",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF894F3D),
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "Prime factors of 24: 2² × 3¹",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "Prime factors of 36: 2² × 3²",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "Common prime factors with lowest exponent: 2² and 3¹",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "HCF = 2² × 3¹ = 4 × 3 = 12",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  int _calculateHcf(int a, int b) {
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }
}

