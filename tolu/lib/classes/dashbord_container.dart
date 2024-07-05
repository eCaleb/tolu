import 'package:flutter/material.dart';

class DashboardContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const DashboardContainer({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 208, 207, 207),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: const Color.fromARGB(255, 149, 77, 51)),
            const SizedBox(width: 8.0),
            Text(
              text,
              style: const TextStyle(color:  Color.fromARGB(255, 149, 77, 51),fontSize: 20,fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
