import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnglishQuiz extends StatefulWidget {
  const EnglishQuiz({Key? key}) : super(key: key);

  @override
  State<EnglishQuiz> createState() => _EnglishQuizState();
}

class _EnglishQuizState extends State<EnglishQuiz> {
  final List<EnglishQuestion> questions = [
    EnglishQuestion(
      question: 'What is the plural of "child"?',
      answer: 'Children',
    ),
    EnglishQuestion(
      question: 'Which word is a synonym of "happy"?',
      answer: 'Joyful',
    ),
    // Add more questions as needed
  ];

  int currentQuestionIndex = 0;
  String userAnswer = '';
  bool showResult = false;
  bool quizCompleted = false; // Track if quiz is completed

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _loadQuizStatus();
  }

  Future<void> _loadQuizStatus() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      quizCompleted = prefs.getBool('english_quiz_completed') ?? false;
    });
  }

  void _saveQuizStatus() {
    prefs.setBool('english_quiz_completed', true);
  }

  void _resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      userAnswer = '';
      showResult = false;
      quizCompleted = false;
      _saveQuizStatus(); // Reset completion status
    });
  }

  void checkAnswer() {
    setState(() {
      showResult = true;
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        userAnswer = '';
        showResult = false;
      } else {
        quizCompleted = true; // Mark quiz as completed
        _saveQuizStatus(); // Save completion status
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('English quiz completed!'),
          ),
        );
        Future.delayed(const Duration(seconds: 2), () {
          // Navigate back to previous screen
          Navigator.pop(context);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        title: const Text('English Quiz'),
        backgroundColor: const Color.fromARGB(255, 149, 77, 51),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (quizCompleted)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'English quiz already completed!',
                  style: TextStyle(fontSize: 18.0, color: Colors.green),
                ),
              ),
            if (!quizCompleted)
              Column(
                children: [
                  Text(
                    questions[currentQuestionIndex].question,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        userAnswer = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your answer',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (userAnswer == questions[currentQuestionIndex].answer) {
                        if (currentQuestionIndex < questions.length - 1) {
                          nextQuestion();
                        } else {
                          quizCompleted = true; // Mark quiz as completed
                          _saveQuizStatus(); // Save completion status
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('English quiz completed!'),
                            ),
                          );
                          Future.delayed(const Duration(seconds: 2), () {
                            // Navigate back to previous screen
                            Navigator.pop(context);
                          });
                        }
                      } else {
                        checkAnswer();
                      }
                    },
                    child: const Text('Submit'),
                  ),
                  const SizedBox(height: 20.0),
                  if (showResult)
                    Text(
                      userAnswer == questions[currentQuestionIndex].answer
                          ? 'Correct!'
                          : 'Incorrect. The correct answer is ${questions[currentQuestionIndex].answer}.',
                      style: TextStyle(
                        color: userAnswer == questions[currentQuestionIndex].answer
                            ? Colors.green
                            : Colors.red,
                        fontSize: 18.0,
                      ),
                    ),
                ],
              ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _resetQuiz,
              child: const Text('Reset Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

class EnglishQuestion {
  final String question;
  final String answer;

  EnglishQuestion({
    required this.question,
    required this.answer,
  });
}
