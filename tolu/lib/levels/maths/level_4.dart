import 'package:flutter/material.dart';

class Level4 extends StatelessWidget {
  const Level4({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(child: Text("LEVEL 4")),
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
                  "Division",
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
          const SizedBox(height: 50,),
         const Center(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding:  EdgeInsets.all(18.0),
                child: SizedBox(
                  width: 390,
                  child: Text(
                    "Division is splitting a number into equal parts. For example, 12 divided by 3 equals 4 (12 ÷ 3 = 4).",
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
                      "12", // Numerator
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
                "÷", // Division sign
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
                      "3", // Denominator
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
                      "4", // Result of division
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
