import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/core/constants/images_list.dart';
import 'package:lms_mobileapp/features/init/presentation/onboarding/models/onboarding_item.dart';
import 'package:lms_mobileapp/features/init/presentation/onboarding/widgets/onboarding_header.dart';
import 'package:lms_mobileapp/features/init/presentation/onboarding/widgets/onboarding_indicators.dart';
import 'package:lms_mobileapp/features/init/presentation/onboarding/widgets/onboarding_page_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      image: ImagesList.onboarding1,
      title1: 'Learn at Your',
      title2: 'Own Pace',
      description:
          'Access thousands of courses from industry experts and master new skills in a beautifully curated digital environment.',
    ),
    OnboardingItem(
      image: ImagesList.onboarding2,
      title1: 'Learn from the',
      title2: 'Best',
      description:
          'Get direct access to industry experts and masterclasses designed to take your skills to the next level.',
    ),
    OnboardingItem(
      image: ImagesList.onboarding3,
      title1: 'Earn',
      title2: 'Certificates',
      description:
          'Complete assessments, pass quizzes, and earn verified certificates to showcase your professional achievements.',
      features: [
        'Interactive quizzes with instant feedback',
        'Track your progress with detailed analytics',
        'Verified certificates upon completion',
      ],
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentIndex < _onboardingItems.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacementNamed(AppRoutes.login);
    }
  }

  void _skip() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              OnboardingHeader(onSkip: _skip),
              AppSpacing.verticalLg,

              // PageView
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _onboardingItems.length,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    return OnboardingPageContent(item: _onboardingItems[index]);
                  },
                ),
              ),

              AppSpacing.verticalLg,

              // Indicators
              OnboardingIndicators(
                currentIndex: _currentIndex,
                totalPages: _onboardingItems.length,
              ),

              AppSpacing.verticalXl,

              // Button
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 4,
                    shadowColor: AppColors.primary.withOpacity(0.25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _currentIndex == _onboardingItems.length - 1
                            ? 'Get Started'
                            : 'Next',
                        style: AppTextTheme.buttonText.copyWith(
                          color: AppColors.textOnPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}