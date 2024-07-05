import 'package:flutter/material.dart';

class ScienceContainer extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const ScienceContainer({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 90,
          width: 100,
          decoration: BoxDecoration(
            color: const Color(0xFFCB5BE7),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(left:65.0),
                child: Icon(Icons.star, color: Colors.black),
              ),
              const SizedBox(height: 6,),
              Container(
                height: 20,
                width: 130,
                color: const Color(0xFFF3BFF8),
              ),
              Stack(
                children: [
                 Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(color: const Color(0xFF80065D),
                borderRadius: BorderRadius.circular(5)
                ),
                
              ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 19.8,
                        width: 53,
                        decoration: BoxDecoration(
                            color: const Color(0xFFCB5BE7),
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: Text(
                            text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
