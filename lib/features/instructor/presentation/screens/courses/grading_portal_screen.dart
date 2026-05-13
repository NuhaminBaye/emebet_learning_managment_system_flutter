import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/primary_button.dart';

class GradingPortalScreen extends StatefulWidget {
  const GradingPortalScreen({super.key});

  @override
  State<GradingPortalScreen> createState() => _GradingPortalScreenState();
}

class _GradingPortalScreenState extends State<GradingPortalScreen> {
  final _scoreController = TextEditingController(text: '88');
  final _feedbackController = TextEditingController();

  @override
  void dispose() {
    _scoreController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }

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
          'Grading Portal',
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
            Text(
              'DESIGN STUDIO · Minimalist Form Study',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.85,
                color: InstructorDesign.primary.withValues(alpha: 0.95),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Review the submission, assign a score, and leave clear feedback.',
              style: TextStyle(
                fontSize: 14,
                height: 1.45,
                color: InstructorDesign.textSecondary,
              ),
            ),
            const SizedBox(height: 20),
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
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundColor:
                            InstructorDesign.primary.withValues(alpha: 0.12),
                        child: const Text(
                          'J',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: InstructorDesign.primary,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Julian K. Sterling',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                                color: InstructorDesign.textPrimary,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Assignment: Minimalist Form Study',
                              style: TextStyle(
                                fontSize: 12,
                                color: InstructorDesign.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: InstructorDesign.surfaceMuted,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Student',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: InstructorDesign.textTertiary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: InstructorDesign.canvas,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: InstructorDesign.chipInactiveBg),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: InstructorDesign.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.picture_as_pdf_rounded,
                            color: InstructorDesign.primary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'submission_final_rev.pdf',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '4.8 MB • Uploaded recently',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: InstructorDesign.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.download_outlined,
                            color: InstructorDesign.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: InstructorDesign.surface,
                borderRadius: BorderRadius.circular(InstructorDesign.radiusCard),
                boxShadow: InstructorDesign.cardShadow(context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'FINAL SCORE',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                      color: InstructorDesign.textTertiary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      SizedBox(
                        width: 72,
                        child: TextField(
                          controller: _scoreController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w900,
                            color: InstructorDesign.primary,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      const Text(
                        ' / 100',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: InstructorDesign.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'INSTRUCTOR FEEDBACK',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
                color: InstructorDesign.textTertiary,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: InstructorDesign.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: InstructorDesign.chipInactiveBg),
                boxShadow: InstructorDesign.cardShadow(context),
              ),
              child: TextField(
                controller: _feedbackController,
                minLines: 5,
                maxLines: 8,
                decoration: InputDecoration(
                  hintText:
                      'Constructive notes on composition, materials, and concept…',
                  hintStyle: TextStyle(
                    color: InstructorDesign.textSecondary.withValues(alpha: 0.85),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              label: 'SUBMIT GRADE',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Grade submitted')),
                );
              },
            ),
            const SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Save as Draft',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: InstructorDesign.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _footerStat(
                    title: 'Class Average',
                    value: '84.2',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _footerStat(
                    title: 'Graded Today',
                    value: '12 / 24',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _footerStat({required String title, required String value}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: InstructorDesign.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: InstructorDesign.chipInactiveBg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: InstructorDesign.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: InstructorDesign.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
