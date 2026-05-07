import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;

  const SectionHeader({
    super.key,
    required this.title,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextTheme.headingMD),
        if (onSeeAll != null)
          TextButton(
            onPressed: onSeeAll,
            child: Text('See all', style: AppTextTheme.bodyMedium.copyWith(color: AppColors.primary)),
          )
      ],
    );
  }
}