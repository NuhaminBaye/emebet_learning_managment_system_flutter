import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.green.shade50,
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 4),
          Text(title),
        ],
      ),
    );
  }
}