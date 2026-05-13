import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';

class QuizQuestionCard extends StatelessWidget {
  const QuizQuestionCard({
    super.key,
    required this.type,
    required this.question,
    required this.detail,
  });

  final String type;
  final String question;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: InstructorDesign.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: InstructorDesign.cardShadow(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.9,
              color: InstructorDesign.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            question,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 14,
              height: 1.35,
              color: InstructorDesign.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            detail,
            style: const TextStyle(
              fontSize: 12,
              color: InstructorDesign.textSecondary,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}
