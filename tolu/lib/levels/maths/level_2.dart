import 'package:flutter/material.dart';

class Level2 extends StatelessWidget {
  const Level2({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(child: Text("LEVEL 2")),
      ),
      body: Column(
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
                  "Subtraction", // Updated title
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // This color is necessary for ShaderMask
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50,),
         const Center(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: SizedBox(
                  width: 390,
                  child: Text(
                    "Subtraction is taking away one number from another. For example, if you have 6 apples and take away 5, you have 1 apple left.", // Updated explanation
                    style: TextStyle(
                      color: Color(0xFF894F3D),
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w900,
                      fontSize: 17.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 43.0),
                child: Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "6", // First operand (start number)
                      style: TextStyle(
                        color: Color(0xFF894F3D),
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30,),
              const Text(
                "-", // Subtraction sign
                style: TextStyle(
                  color: Color(0xFF894F3D),
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(width: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "5", // Second operand (amount to subtract)
                      style: TextStyle(
                        color: Color(0xFF894F3D),
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30,),
              const Text(
                "=", // Equal sign
                style: TextStyle(
                  color: Color(0xFF894F3D),
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(width: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "1", // Result of subtraction
                      style: TextStyle(
                        color: Color(0xFF894F3D),
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
