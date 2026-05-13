import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';

class QuizSettingTile extends StatelessWidget {
  const QuizSettingTile({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: InstructorDesign.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: InstructorDesign.chipInactiveBg),
        boxShadow: InstructorDesign.cardShadow(context),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: InstructorDesign.textPrimary,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 14,
              color: InstructorDesign.textPrimary,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right_rounded,
              color: InstructorDesign.textTertiary, size: 22),
        ],
      ),
    );
  }
}
