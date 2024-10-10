import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  final IconData icon;
  final String label;
  final void Function()? onTap;

  const InfoContainer({required this.icon, required this.label, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.black),
        ),
        padding: const EdgeInsets.all(11),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon),
            const SizedBox(height: 5),
            Text(
              label,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
