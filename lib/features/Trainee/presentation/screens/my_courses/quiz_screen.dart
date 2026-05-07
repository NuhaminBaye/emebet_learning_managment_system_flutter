import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 3;
  String? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("The Atelier", style: AppTextTheme.headingMD),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Icon(Icons.timer_outlined, size: 20),
                SizedBox(width: 6),
                Text("14:59", style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("ARCHITECTURE & ENVIRONMENT", style: AppTextTheme.bodySmall.copyWith(color: Colors.green)),
                const Spacer(),
                Text("Question $currentQuestion/10", style: AppTextTheme.bodyMedium),
                const Spacer(),
                const Text("30% Complete", style: AppTextTheme.bodyMedium),
              ],
            ),
            AppSpacing.verticalSm,
            LinearProgressIndicator(value: 0.3, backgroundColor: AppColors.grey100, color: Colors.green),

            AppSpacing.verticalLg,

            Text("What is the primary benefit of urban green spaces in high-density metropolitan areas?", style: AppTextTheme.headingMD),

            AppSpacing.verticalLg,

            // Options
            _buildOption("Reduction of the urban heat island effect", false),
            _buildOption("Enhancement of biological diversity and carbon sequestration", true),
            _buildOption("Promotion of social cohesion through public gathering zones", false),
            _buildOption("Stabilization of property values in adjacent districts", false),

            const Spacer(),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("Previous"),
                  ),
                ),
                AppSpacing.horizontalMd,
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF22C55E)),
                    child: const Text("Next Question →"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        // You can add Bloc logic here later
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF22C55E).withOpacity(0.1) : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF22C55E) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isSelected ? const Color(0xFF22C55E) : Colors.grey,
            ),
            AppSpacing.horizontalMd,
            Expanded(child: Text(text, style: AppTextTheme.bodyMedium)),
          ],
        ),
      ),
    );
  }
}