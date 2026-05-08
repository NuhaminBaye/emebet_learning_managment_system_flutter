import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/init/presentation/onboarding/models/onboarding_item.dart';

class OnboardingPageContent extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPageContent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Image Container - Matches design perfectly
          Container(
            width: double.infinity,
            height: 300,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F2FA),
              borderRadius: BorderRadius.circular(34),
              border: Border.all(color: AppColors.border),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Image.asset(
                item.image,
                fit: BoxFit.cover,
              ),
            ),
          ),

          AppSpacing.verticalXl,

          // Title with accent color
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTextTheme.headingLG.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w800,
                height: 1.2,
              ),
              children: [
                TextSpan(text: '${item.title1}\n'),
                TextSpan(
                  text: item.title2,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),

          AppSpacing.verticalLg,

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              item.description,
              textAlign: TextAlign.center,
              style: AppTextTheme.bodyMedium.copyWith(
                color: AppColors.grey600,
                fontSize: 16,
                height: 1.8,
              ),
            ),
          ),

          // Features List (Only for last page)
          if (item.features != null) ...[
            AppSpacing.verticalLg,
            Column(
              children: item.features!.map((feature) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          feature,
                          style: AppTextTheme.bodyMedium.copyWith(
                            color: AppColors.grey600,
                            height: 1.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}