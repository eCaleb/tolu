import 'package:flutter/material.dart';

class Level2e extends StatelessWidget {
  const Level2e({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(child: Text("LEVEL 2")),
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
                    "Basic Vocabulary",
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
            _buildVocabularyCard(
              "Word: Dog",
              "Definition: A domestic mammal that has a good sense of smell, and alway barks",
            ),
            const SizedBox(height: 10),
            _buildSentenceStructureCard(
              "Example: The dog barks loudly.",
              "In this sentence, 'The dog' is the subject, 'barks' is the verb, and 'loudly' describes how the dog barks.",
            ),
            const SizedBox(height: 10),
            _buildVocabularyCard(
              "Word: Book",
              "Definition: A set of written pages.",
            ),
            const SizedBox(height: 10),
            _buildSentenceStructureCard(
              "Example: She reads a book every night.",
              "In this sentence, 'She' is the subject, 'reads' is the verb, and 'a book' is the object.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVocabularyCard(String title, String definition) {
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
              definition,
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

  Widget _buildSentenceStructureCard(String exampleTitle, String exampleContent) {
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
              exampleContent,
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
