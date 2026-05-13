import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/shared/widgets/buttons/primary_button.dart';
import 'package:lms_mobileapp/shared/widgets/cards/quiz_option_card.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 3;
  String selectedAnswer = "Enhancement of biological diversity and carbon sequestration";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
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
            _buildOption("Reduction of the urban heat island effect"),
            _buildOption("Enhancement of biological diversity and carbon sequestration"),
            _buildOption("Promotion of social cohesion through public gathering zones"),
            _buildOption("Stabilization of property values in adjacent districts"),

            const Spacer(),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      side: const BorderSide(color: AppColors.grey300),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text("Previous"),
                  ),
                ),
                AppSpacing.horizontalMd,
                Expanded(
                  child: PrimaryButton(
                    text: "Next Question",
                    onPressed: () {},
                    height: 50,
                    icon: const Icon(Icons.arrow_forward_rounded, size: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String text) {
    return QuizOptionCard(
      label: text,
      selected: selectedAnswer == text,
      onTap: () => setState(() => selectedAnswer = text),
    );
  }
}