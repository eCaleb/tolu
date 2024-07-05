import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String imagePath;
  final Color color;
  final VoidCallback onTap;

  const CustomContainer({
    super.key,
    required this.imagePath,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 3.5),
          color: color,
          borderRadius: BorderRadius.circular(11),
          image: DecorationImage(
            image: AssetImage(imagePath),
          ),
        ),
      ),
    );
  }
}
