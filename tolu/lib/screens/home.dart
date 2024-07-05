import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String fullName; // Add this parameter

  const Home({
    Key? key,
    required this.fullName,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double progressValue = 0.67; // Example progress value (0.67 means 67%)
  int studiedMinutes = 20;
  int targetMinutes = 30;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 220.0, left: 39),
              child: Image.asset("assets/images/rect1.png", scale: 1.2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 268.0, left: 50),
              child: Column(
                children: [
                  Text(
                    "Hi, ${widget.fullName}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 18),
                  ),
                  Text("Learning is fun", style: TextStyle(fontSize: 17)),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 219.0, left: 190),
                  child: Image.asset("assets/images/girl.png"),
                )
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Container(
                  height: 10,
                  width: 300,
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(15),
                    value: progressValue, // Set the progress value here
                    backgroundColor: Color.fromARGB(255, 245, 183, 164),
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF894F3D)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                    "Studied for $studiedMinutes minutes today",
                    style: TextStyle(fontSize: 10,color: Color(0xFF894F3D)),
                  ),
                  SizedBox(width: 78,),
                  Text("Target $targetMinutes minutes",style: TextStyle(color: Color(0xFF894F3D),fontSize: 10),)
               ], ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Image.asset("assets/images/girly.png"),
        )
      ],
    );
  }
}
