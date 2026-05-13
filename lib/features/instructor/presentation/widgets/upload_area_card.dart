import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';

class UploadAreaCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconData;
  final VoidCallback onTap;
  final Color iconBackgroundColor;
  final Color iconColor;

  const UploadAreaCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconData,
    required this.onTap,
    this.iconBackgroundColor = const Color(0xFFF3F4F6),
    this.iconColor = InstructorDesign.primary,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.lg,
        ),
        decoration: BoxDecoration(
          color: InstructorDesign.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: InstructorDesign.chipInactiveBg,
            width: 1.5,
          ),
          boxShadow: InstructorDesign.cardShadow(context),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                iconData,
                size: 26,
                color: iconColor,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              title,
              style: AppTextTheme.bodyMedium.copyWith(
                fontWeight: FontWeight.w700,
                color: InstructorDesign.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: AppTextTheme.bodySmall.copyWith(
                color: InstructorDesign.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
