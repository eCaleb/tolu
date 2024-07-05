
import 'package:flutter/material.dart';

class Level6e extends StatelessWidget {
  const Level6e({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 209),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(child: Text("LEVEL 6")),
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
                    "Writing Skills",
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
              "Essay Structure",
              "Essays are structured pieces of writing that typically include an introduction, body paragraphs, and a conclusion. They present arguments or discuss topics in a cohesive manner.",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example: Introduction",
              "An effective introduction grabs the reader's attention and introduces the topic or main idea of the essay.",
              "Example: 'In today's digital age, social media plays a pivotal role in shaping public opinion.'",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example: Body Paragraphs",
              "Body paragraphs develop the main ideas or arguments of the essay, supported by evidence or examples.",
              "Example: 'For instance, social media platforms like Twitter and Facebook serve as powerful tools for spreading information instantaneously.'",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example: Conclusion",
              "A conclusion summarizes the main points discussed in the essay and reinforces the writer's stance or findings.",
              "Example: 'Therefore, while social media offers unprecedented connectivity, its impact on public discourse necessitates critical evaluation.'",
            ),
            const SizedBox(height: 10),
            _buildContentCard(
              "Narrative Writing",
              "Narrative writing tells a story, often from the author's perspective. It includes characters, settings, and a plot that unfolds over time.",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example: Characterization",
              "Effective narratives develop characters through their actions, dialogue, and motivations.",
              "Example: 'Sarah's determination to conquer her fear of heights was evident as she stood at the edge of the cliff.'",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example: Setting",
              "The setting of a narrative establishes the time, place, and atmosphere where the story unfolds.",
              "Example: 'The old mansion stood silent and imposing, its shadows lengthening as dusk approached.'",
            ),
            const SizedBox(height: 10),
            _buildContentCard(
              "Descriptive Writing",
              "Descriptive writing vividly portrays a person, place, or object using sensory details to create a sensory experience for the reader.",
            ),
            const SizedBox(height: 10),
            _buildExampleCard(
              "Example: Sensory Details",
              "Descriptive writing engages the reader's senses—sight, sound, touch, taste, and smell—to evoke a vivid mental image.",
              "Example: 'The aroma of freshly baked bread wafted through the air, mingling with the laughter of children playing in the park.'",
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

