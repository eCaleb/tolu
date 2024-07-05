import 'package:flutter/material.dart';

class Level9e extends StatelessWidget {
  const Level9e({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(child: Text("LEVEL 9")),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildConceptCard(
              "Analyzing Texts",
              "Understand and evaluate texts by looking at how arguments are made, evidence is presented, and language is used.",
            ),
            const SizedBox(height: 20),
            _buildConceptCard(
              "Synthesizing Information",
              "Combine ideas from different sources to create new opinions on a topic.",
            ),
            const SizedBox(height: 20),
            _buildConceptCard(
              "Evaluating Sources",
              "Judge the reliability, credibility, and relevance of information sources used in research or arguments.",
            ),
            const SizedBox(height: 20),
            _buildConceptCard(
              "Constructing Arguments",
              "Develop clear and persuasive arguments supported by evidence.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConceptCard(String title, String description) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              description,
              textAlign: TextAlign.justify,
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
