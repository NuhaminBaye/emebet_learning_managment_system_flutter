import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';

class QuizProgressIndicator extends StatelessWidget {
  const QuizProgressIndicator({
    super.key,
    required this.value,
    required this.label,
    required this.subtitle,
  });

  final double value;
  final String label;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 14,
                color: InstructorDesign.textPrimary,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: InstructorDesign.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            minHeight: 10,
            value: value,
            backgroundColor: InstructorDesign.chipInactiveBg.withValues(alpha: 0.6),
            color: InstructorDesign.primary,
          ),
        ),
      ],
    );
  }
}
