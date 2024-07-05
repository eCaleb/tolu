import 'package:flutter/material.dart';
import 'package:tolu/quizes/arts_quiz.dart';
import 'package:tolu/quizes/english_quiz.dart';
import 'package:tolu/quizes/maths_quiz.dart';
import 'package:tolu/quizes/science_quiz.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 308.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MathsQuiz()));},
                        child: Image.asset(
                          "assets/images/maths.png",
                          scale: 1.5,
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EnglishQuiz()));
                        },
                        child: Image.asset(
                          "assets/images/english.png",
                          scale: 1.5,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Maths quiz",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  Text("English quiz",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600))
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ArtsQuiz()));},
                      child: Image.asset(
                        "assets/images/arts.png",
                        scale: 1.5,
                      )),
                  GestureDetector(
                      onTap: () {           Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScienceQuiz()));},
                      child: Image.asset(
                        "assets/images/sciences.png",
                        scale: 1.5,
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Arts quiz",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  Text("Science quiz",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
