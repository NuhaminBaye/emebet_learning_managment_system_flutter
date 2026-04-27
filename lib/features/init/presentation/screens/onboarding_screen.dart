import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<_OnboardingPage> _pages = const [
    _OnboardingPage(
      imageLabel: 'Learn at your own pace',
      title: 'Learn at Your Own Pace',
      description:
          'Access thousands of courses from industry experts and master new skills in a beautifully curated digital environment.',
    ),
    _OnboardingPage(
      imageLabel: 'Expert mentors',
      title: 'Learn from the Best',
      description:
          'Get direct access to industry experts and masterclasses designed to take your skills to the next level.',
    ),
    _OnboardingPage(
      imageLabel: 'Earn certificates',
      title: 'Earn Certificates',
      description:
          'Complete assessments, pass quizzes, and earn verified certificates to showcase your professional achievements.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleNext() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacementNamed(AppRoutes.login);
    }
  }

  void _handleSkip() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.sectionPadding,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lumina Academy',
                    style: AppTextTheme.headingMD.copyWith(color: AppColors.primary),
                  ),
                  TextButton(
                    onPressed: _handleSkip,
                    child: Text(
                      'Skip',
                      style: AppTextTheme.bodyMedium.copyWith(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
              AppSpacing.verticalLg,
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) => setState(() => _currentIndex = index),
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return _OnboardingCard(page: page);
                  },
                ),
              ),
              AppSpacing.verticalLg,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentIndex == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == index ? AppColors.primary : AppColors.border,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              AppSpacing.verticalLg,
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _handleNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.textOnPrimary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Text(
                    _currentIndex == _pages.length - 1 ? 'Get Started' : 'Next',
                    style: AppTextTheme.buttonText.copyWith(color: AppColors.textOnPrimary),
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

class _OnboardingCard extends StatelessWidget {
  const _OnboardingCard({required this.page});

  final _OnboardingPage page;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey300.withAlpha(153),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Center(
                        child: Text(
                          page.imageLabel,
                          textAlign: TextAlign.center,
                          style: AppTextTheme.bodyMedium.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                AppSpacing.verticalLg,
                Text(
                  page.title,
                  textAlign: TextAlign.center,
                  style: AppTextTheme.headingLG.copyWith(color: AppColors.grey900),
                ),
                AppSpacing.verticalSm,
                Text(
                  page.description,
                  textAlign: TextAlign.center,
                  style: AppTextTheme.bodyRegular.copyWith(color: AppColors.textSecondary.withAlpha(153)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _OnboardingPage {
  final String imageLabel;
  final String title;
  final String description;

  const _OnboardingPage({
    required this.imageLabel,
    required this.title,
    required this.description,
  });
}
