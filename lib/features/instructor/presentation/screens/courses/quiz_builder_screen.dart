import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/dashed_border_container.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/primary_button.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/quiz_question_card.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/quiz_setting_tile.dart';

class QuizBuilderScreen extends StatefulWidget {
  const QuizBuilderScreen({super.key});

  @override
  State<QuizBuilderScreen> createState() => _QuizBuilderScreenState();
}

class _QuizBuilderScreenState extends State<QuizBuilderScreen> {
  double _passingGrade = 0.75;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InstructorDesign.canvas,
      appBar: AppBar(
        backgroundColor: InstructorDesign.canvas,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          color: InstructorDesign.textPrimary,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Quiz Builder',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
            color: InstructorDesign.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _labeledField(
              label: 'Quiz Title',
              child: _quizField(
                hint:
                    'Advanced Botany: Cellular Structures',
                maxLines: 1,
              ),
            ),
            const SizedBox(height: 18),
            _labeledField(
              label: 'Description',
              child: _quizField(
                hint:
                    'Assessment covering mitochondria, chloroplasts, and cell wall functions…',
                maxLines: 4,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Text(
                  'Questions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: InstructorDesign.textPrimary,
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: InstructorDesign.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '2 ADDED',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.6,
                      color: InstructorDesign.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            DashedBorderContainer(
              padding: const EdgeInsets.all(14),
              backgroundColor: InstructorDesign.surfaceMuted.withValues(alpha: 0.35),
              child: Column(
                children: [
                  const QuizQuestionCard(
                    type: 'MULTIPLE CHOICE',
                    question:
                        'Which organelle is primarily responsible for photosynthesis?',
                    detail: '4 options · Correct: Chloroplast',
                  ),
                  const SizedBox(height: 12),
                  const QuizQuestionCard(
                    type: 'TRUE / FALSE',
                    question:
                        'The cell wall provides structural support to plant cells.',
                    detail: 'Correct: True',
                  ),
                  const SizedBox(height: 12),
                  _addQuestionTile(context),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Quiz Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: InstructorDesign.textPrimary,
              ),
            ),
            const SizedBox(height: 14),
            const QuizSettingTile(
              label: 'Time Limit',
              value: '30 minutes',
            ),
            const SizedBox(height: 12),
            const QuizSettingTile(
              label: 'Allowed Attempts',
              value: '2 attempts',
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: InstructorDesign.surface,
                borderRadius: BorderRadius.circular(InstructorDesign.radiusCard),
                boxShadow: InstructorDesign.cardShadow(context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Passing Grade',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          color: InstructorDesign.textPrimary,
                        ),
                      ),
                      Text(
                        '${(_passingGrade * 100).round()}%',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: InstructorDesign.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: InstructorDesign.primary,
                      inactiveTrackColor:
                          InstructorDesign.chipInactiveBg.withValues(alpha: 0.8),
                      thumbColor: InstructorDesign.primary,
                      overlayColor:
                          InstructorDesign.primary.withValues(alpha: 0.12),
                    ),
                    child: Slider(
                      value: _passingGrade,
                      min: 0.5,
                      max: 1,
                      divisions: 10,
                      onChanged: (v) => setState(() => _passingGrade = v),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: _passingGrade,
                      minHeight: 8,
                      backgroundColor:
                          InstructorDesign.chipInactiveBg.withValues(alpha: 0.6),
                      color: InstructorDesign.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            PrimaryButton(
              label: 'SAVE QUIZ',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Quiz saved')),
                );
              },
              icon: const Icon(Icons.save_rounded, size: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _labeledField({required String label, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: InstructorDesign.textTertiary,
          ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }

  Widget _quizField({required String hint, required int maxLines}) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        color: InstructorDesign.textPrimary,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: InstructorDesign.textSecondary.withValues(alpha: 0.85),
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: InstructorDesign.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _addQuestionTile(BuildContext context) {
    return Material(
      color: InstructorDesign.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: InstructorDesign.primary.withValues(alpha: 0.35),
              width: 1.4,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: InstructorDesign.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.add_rounded,
                    color: InstructorDesign.primary),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Add Question',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    color: InstructorDesign.textPrimary,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right_rounded,
                  color: InstructorDesign.primary),
            ],
          ),
        ),
      ),
    );
  }
}
