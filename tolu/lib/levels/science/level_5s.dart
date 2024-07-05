import 'package:flutter/material.dart';

class Level5s extends StatelessWidget {
  const Level5s({Key? key}) : super(key: key);

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
                    "Simple Machines",
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
              "What are Machines?",
              "Machines are tools that help us do work. They can make work easier by changing the force or direction of a push or pull.",
            ),
            const SizedBox(height: 20),
            _buildMachineCard(
              "Lever",
              "A lever is like a seesaw. It helps lift things up by pushing down on one end. Examples include seesaws and crowbars.",
            ),
            const SizedBox(height: 10),
            _buildMachineCard(
              "Pulley",
              "A pulley is like a wheel with a rope around it. It helps lift heavy things by pulling down on the rope. Examples include flagpoles and blinds.",
            ),
            const SizedBox(height: 10),
            _buildMachineCard(
              "Wheel and Axle",
              "A wheel and axle help move things faster and with less effort. The wheel spins around a rod (axle). Examples include wheels on cars and bikes.",
            ),
            const SizedBox(height: 10),
            _buildMachineCard(
              "Inclined Plane",
              "An inclined plane is like a ramp. It helps move things up or down easily instead of lifting them straight up. Examples include ramps and slides.",
            ),
            const SizedBox(height: 10),
            _buildMachineCard(
              "Wedge",
              "A wedge is like a sharp edge that helps split things apart. It can also hold things together. Examples include knives and doorstops.",
            ),
            const SizedBox(height: 10),
            _buildMachineCard(
              "Screw",
              "A screw is like a twisted rod with a pointed end. It helps hold things together by turning into wood or metal. Examples include screws and bolts.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScienceCard(String title, String content) {
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

  Widget _buildMachineCard(String title, String content) {
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
