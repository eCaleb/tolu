import 'package:flutter/material.dart';

class ArtsLevel extends StatelessWidget {
  const ArtsLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("LEVEL 1"),
      ),
      body: Column(
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
                  "Shapes",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color:
                        Colors.white, 
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/rectangle.png"),
              const SizedBox(
                width: 30,
              ),
              Image.asset("assets/images/triangle.png")
            ],
          ),
          const SizedBox(height: 10,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Rectangle",
                style: TextStyle(
                    color: Color(0xFF894F3D),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Triangle",
                style: TextStyle(
                    color: Color(0xFF894F3D),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          const SizedBox(height: 50,),
             Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/circle.png"),
              const SizedBox(
                width: 30,
              ),
              Image.asset("assets/images/star.png")
            ],
          ),
          const SizedBox(height: 10,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Circle",
                style: TextStyle(
                    color: Color(0xFF894F3D),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Star",
                style: TextStyle(
                    color: Color(0xFF894F3D),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ],
      ),
    );
  }
}
