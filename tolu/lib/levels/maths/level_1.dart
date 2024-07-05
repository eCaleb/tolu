import 'package:flutter/material.dart';

class MathsLevel extends StatelessWidget {
  const MathsLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  "Addition",
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
         const SizedBox(height: 50,),
const Center(
  child: Align(
    alignment: Alignment.center,
    child: Padding(
      padding: EdgeInsets.all(18.0),
      child: SizedBox(
        width: 390,
        child:Text("Addition is joining two numbers together. For example if you have 2 apples and add 3 more,you have a total of 5 apples.",style: TextStyle(color: Color(0xFF894F3D),letterSpacing: 1.0,fontWeight: FontWeight.w900,fontSize: 17.5),),),
    ),
  ),
),
const SizedBox(height: 40,),
Row(children: [
  Padding(
    padding: const EdgeInsets.only(left:43.0),
    child: Container(
      height: 40,
      width: 50,
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
      child: const Center(child: Text("2",style: TextStyle(color: Color(0xFF894F3D),fontSize: 17,fontWeight: FontWeight.w800),)),
    ),
  ),
  const SizedBox(width: 30,),
  const Text("+",style: TextStyle(color: Color(0xFF894F3D),fontSize: 20,fontWeight: FontWeight.w900),),
   const SizedBox(width: 30,),
   Padding(
     padding: const EdgeInsets.all(8.0),
     child: Container(
        height: 40,
        width: 50,
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
        child: const Center(child: Text("3",style: TextStyle(color: Color(0xFF894F3D),fontSize: 17,fontWeight: FontWeight.w800),)),
      ),
   ),
   const SizedBox(width: 30,),
   const Text("=",style: TextStyle(color: Color(0xFF894F3D),fontSize: 20,fontWeight: FontWeight.w900),),
   const SizedBox(width: 30,),
   Padding(
     padding: const EdgeInsets.all(8.0),
     child: Container(
        height: 40,
        width: 50,
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
        child: const Center(child: Text("5",style: TextStyle(color: Color(0xFF894F3D),fontSize: 17,fontWeight: FontWeight.w800),)),
      ),
   ),
],)
        ],
      ),
    );
  }
}
