import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class QuizBuilderScreen extends StatelessWidget {
  const QuizBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        title: const Text("Quiz Builder", style: AppTextTheme.headingMD),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("QUIZ TITLE", style: AppTextTheme.bodySmall),
            AppSpacing.verticalSm,
            TextField(
              decoration: InputDecoration(
                hintText: "Advanced Botany: Cellular Structures",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: AppColors.surface,
              ),
            ),

            AppSpacing.verticalLg,

            const Text("DESCRIPTION", style: AppTextTheme.bodySmall),
            AppSpacing.verticalSm,
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Detailed assessment covering mitochondria, chloroplasts, and cell wall functions in terrestrial flora...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: AppColors.surface,
              ),
            ),

            AppSpacing.verticalLg,

            // Questions Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Questions", style: AppTextTheme.headingMD),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text("3 ADDED", style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600)),
                ),
              ],
            ),

            AppSpacing.verticalMd,

            _buildQuestionCard("MULTIPLE CHOICE", "Which organelle is primarily responsible for photosynthesis?"),
            _buildQuestionCard("TRUE/FALSE", "The cell wall provides structural support to plant cells."),

            AppSpacing.verticalLg,

            // Quiz Settings
            const Text("Quiz Settings", style: AppTextTheme.headingMD),
            AppSpacing.verticalMd,

            _buildSettingRow("Time Limit", "30 Minutes allowed"),
            _buildSettingRow("Allowed Attempts", "2 Attempts"),
            _buildSettingRow("Passing Grade", "75%"),

            AppSpacing.verticalXl,

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.save),
                label: const Text("SAVE QUIZ"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF22C55E),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionCard(String type, String question) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(type, style: AppTextTheme.bodySmall.copyWith(color: Colors.green, fontWeight: FontWeight.w600)),
          AppSpacing.verticalSm,
          Text(question, style: AppTextTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget _buildSettingRow(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextTheme.bodyMedium),
          Text(value, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}