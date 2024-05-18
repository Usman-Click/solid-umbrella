import 'package:flutter/material.dart';

class MoreInfo extends StatelessWidget {
  final String val;
  final IconData icon;
  final String label;
  const MoreInfo({super.key, required this.label, required this.val, required this.icon});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Icon(icon, size: 32),
          const SizedBox(height: 8),
          Text(label),
          Text("$val%")
        ],
      ),
    );
  }
}