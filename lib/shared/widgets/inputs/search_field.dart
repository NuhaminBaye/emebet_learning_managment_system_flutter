import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;

  const SearchField({
    super.key,
    required this.onChanged,
    this.hintText = 'Search for courses, mentors, or tools...',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: AppTextTheme.bodyRegular,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextTheme.bodyRegular.copyWith(color: AppColors.textSecondary.withOpacity(0.75)),
        prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: AppColors.grey200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: AppColors.grey200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: AppColors.primary.withOpacity(0.4)),
        ),
      ),
    );
  }
}