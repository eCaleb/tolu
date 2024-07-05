
import 'package:flutter/material.dart';

class Level7e extends StatelessWidget {
  const Level7e({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(child: Text("LEVEL 7")),
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
                    "Advanced Grammar",
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
              "Complex Sentence Structures",
              "Complex sentences contain independent clauses joined by subordinate clauses or conjunctions such as 'although,' 'because,' 'while,' etc.",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example: Subordinate Clause",
              "Subordinate clauses provide additional information but cannot stand alone as complete sentences.",
              "'Although she studied hard, she did not pass the exam.'",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example: Coordinating Conjunctions",
              "Coordinating conjunctions (e.g., 'and,' 'but,' 'or') connect independent clauses.",
              "'He wanted to go for a walk, but it started raining.'",
            ),
            const SizedBox(height: 10),
            _buildContentCard(
              "Advanced Verb Tenses",
              "Advanced verb tenses include perfect tenses (present perfect, past perfect, future perfect) and progressive tenses (present progressive, past progressive, future progressive).",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example: Present Perfect",
              "The present perfect tense indicates actions that started in the past and continue to the present or are relevant to the present.",
              "'She has lived in this city for ten years.'",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example: Past Perfect",
              "The past perfect tense indicates actions completed before a specified past time.",
              "'By the time we arrived, he had already left.'",
            ),
            const SizedBox(height: 10),
            _buildContentCard(
              "Subject-Verb Agreement",
              "Subject-verb agreement ensures that subjects and verbs in a sentence agree in number (singular or plural).",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example: Singular Subject",
              "A singular subject requires a singular verb.",
              "'The dog barks loudly every morning.'",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example: Plural Subject",
              "A plural subject requires a plural verb.",
              "'The dogs bark loudly every morning.'",
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
