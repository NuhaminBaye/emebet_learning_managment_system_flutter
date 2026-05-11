import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/dashed_border_container.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/instructor_bottom_navigation_bar.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/primary_button.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/quiz_progress_indicator.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/quiz_question_card.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/quiz_setting_tile.dart';

class QuizBuilderScreen extends StatelessWidget {
  const QuizBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Quiz Builder', style: AppTextTheme.headingMD),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Quiz Title', style: AppTextTheme.bodySmall),
            const SizedBox(height: AppSpacing.sm),
            _buildInputField(
              hintText: 'Advanced Botany: Cellular Structures',
              maxLines: 1,
            ),
            const SizedBox(height: AppSpacing.lg),
            const Text('Description', style: AppTextTheme.bodySmall),
            const SizedBox(height: AppSpacing.sm),
            _buildInputField(
              hintText:
                  'Detailed assessment covering mitochondria, chloroplasts, and cell wall functions in terrestrial flora...',
              maxLines: 4,
            ),
            const SizedBox(height: AppSpacing.xl),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Questions', style: AppTextTheme.headingMD),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '3 ADDED',
                    style: AppTextTheme.bodySmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            DashedBorderContainer(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                children: [
                  const QuizQuestionCard(
                    type: 'MULTIPLE CHOICE',
                    question:
                        'Which organelle is primarily responsible for photosynthesis?',
                    detail: '4 options � Correct: Chloroplast',
                  ),
                  const SizedBox(height: AppSpacing.md),
                  const QuizQuestionCard(
                    type: 'TRUE/FALSE',
                    question:
                        'The cell wall provides structural support to plant cells.',
                    detail: 'Correct: True',
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _buildAddQuestionTile(context),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            const Text('Quiz Settings', style: AppTextTheme.headingMD),
            const SizedBox(height: AppSpacing.md),
            const QuizSettingTile(
              label: 'Time Limit',
              value: '30 Minutes allowed',
            ),
            const SizedBox(height: AppSpacing.md),
            const QuizSettingTile(
              label: 'Allowed Attempts',
              value: '2 Attempts',
            ),
            const SizedBox(height: AppSpacing.md),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey200.withOpacity(0.4),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const QuizProgressIndicator(
                value: 0.75,
                label: 'Passing Grade',
                subtitle: '75%',
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            PrimaryButton(
              label: 'SAVE QUIZ',
              onPressed: () {},
              icon: const Icon(Icons.save, size: 20),
              backgroundColor: AppColors.primary,
            ),
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
      bottomNavigationBar: const InstructorBottomNavigationBar(currentIndex: 1),
    );
  }

  Widget _buildInputField({required String hintText, required int maxLines}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextTheme.bodySmall.copyWith(
          color: AppColors.textSecondary,
        ),
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildAddQuestionTile(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.lg,
        ),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.primary.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.add, color: AppColors.primary),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                'Add Question',
                style: AppTextTheme.bodyMedium.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Icon(Icons.keyboard_arrow_right, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}
