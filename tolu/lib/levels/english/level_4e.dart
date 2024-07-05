import 'package:flutter/material.dart';

class Level4e extends StatelessWidget {
  const Level4e({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(child: Text("LEVEL 4")),
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
                    "Sentence Structure & Punctuation",
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
            _buildContentCard(
              "Understanding Sentence Types",
              "Sentences can be declarative (statements), interrogative (questions), imperative (commands), or exclamatory (expressing strong emotion). Each type has a distinct structure and punctuation.",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example: Declarative Sentence",
              "The sun is shining brightly.",
              "This sentence states a fact and ends with a period.",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example: Interrogative Sentence",
              "Are you coming to the party?",
              "This sentence asks a question and ends with a question mark.",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example: Imperative Sentence",
              "Close the door, please.",
              "This sentence gives a command and ends with a period or exclamation mark, depending on tone.",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example: Exclamatory Sentence",
              "What a beautiful day!",
              "This sentence expresses strong emotion and ends with an exclamation mark.",
            ),
            const SizedBox(height: 10),
            _buildContentCard(
              "Using Commas and Other Punctuation Marks",
              "Commas are used to separate items in a list, join independent clauses with a coordinating conjunction, and set off introductory elements. Other punctuation marks like semicolons, colons, and dashes serve specific purposes in sentence structure.",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example: Using Commas",
              "I bought apples, oranges, and bananas at the store.",
              "Commas separate items in the list 'apples, oranges, and bananas'.",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example: Using Semicolons",
              "She loves to read; her favorite genre is fantasy.",
              "Semicolons join related independent clauses without a coordinating conjunction.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentCard(String title, String content) {
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

  Widget _buildExampleCard(String exampleTitle, String exampleSentence, String exampleExplanation) {
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
              "Example",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF894F3D),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              exampleTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              exampleSentence,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              exampleExplanation,
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
