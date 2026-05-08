import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';

class OnboardingIndicators extends StatelessWidget {
  final int currentIndex;
  final int totalPages;

  const OnboardingIndicators({
    super.key,
    required this.currentIndex,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentIndex == index ? 26 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? AppColors.primary
                : const Color(0xFFD7DCEF),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}