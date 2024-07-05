import 'package:flutter/material.dart';

class FirstLevel extends StatelessWidget {
  const FirstLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(child: Text("LEVEL 1")),
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
                  "Alphabets",
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
          const SizedBox(height: 80),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "A for Apple",
                style: TextStyle(
                    color: Color(0xFF894F3D),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 90,
              ),
              Text(
                "B is for Ball",
                style: TextStyle(
                    color: Color(0xFF894F3D),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/apple.png"),
              const SizedBox(
                width: 90,
              ),
              Image.asset("assets/images/ball.png")
            ],
          ),
          SizedBox(height: 60,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "C for Car",
                style: TextStyle(
                    color: Color(0xFF894F3D),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 90,
              ),
              Text(
                "D is for Dog",
                style: TextStyle(
                    color: Color(0xFF894F3D),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/car.png"),
              const SizedBox(
                width: 90,
              ),
              Image.asset("assets/images/dog.png")
            ],
          ),
        ],
      ),
    );
  }
}
