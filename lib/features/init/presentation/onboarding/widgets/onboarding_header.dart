import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class OnboardingHeader extends StatelessWidget {
  final VoidCallback onSkip;

  const OnboardingHeader({super.key, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Lumina Academy',
          style: AppTextTheme.headingMD.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextButton(
          onPressed: onSkip,
          child: Text(
            'Skip',
            style: AppTextTheme.bodyMedium.copyWith(
              color: AppColors.grey500,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}