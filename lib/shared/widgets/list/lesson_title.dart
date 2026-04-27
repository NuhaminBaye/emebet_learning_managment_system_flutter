import 'package:flutter/material.dart';

class LessonTile extends StatelessWidget {
  final String title;
  final bool completed;

  const LessonTile({
    super.key,
    required this.title,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        completed ? Icons.check_circle : Icons.play_circle,
      ),
      title: Text(title),
    );
  }
}