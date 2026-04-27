import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1800), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.sectionPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.school,
                        size: 40,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  AppSpacing.verticalLg,
                  Text(
                    'Lumina Academy',
                    style: AppTextTheme.headingXL.copyWith(color: AppColors.textOnPrimary),
                  ),
                  AppSpacing.verticalSm,
                  Text(
                    'Where Knowledge Meets Craftsmanship',
                    textAlign: TextAlign.center,
                    style: AppTextTheme.bodyRegular.copyWith(
                      color: AppColors.textOnPrimary.withAlpha(230),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Initializing workspace',
                    style: AppTextTheme.bodyMedium.copyWith(color: AppColors.textOnPrimary.withAlpha(230)),
                  ),
                  AppSpacing.verticalXs,
                  Text(
                    'Version 2.4.0 · Atelier LMS Suite',
                    style: AppTextTheme.caption.copyWith(color: AppColors.textOnPrimary.withAlpha(153)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
