import 'package:flutter/material.dart';

class AvatarContainer extends StatelessWidget {
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const AvatarContainer({
    super.key,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 75,
        width: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 3,
            color: isSelected ? const Color.fromARGB(255, 149, 77, 51) : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
          ),
        ),
      ),
    );
  }
}
