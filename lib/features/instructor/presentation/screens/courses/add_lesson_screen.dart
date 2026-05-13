import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/custom_text_input.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/dashed_border_container.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/primary_button.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/upload_area_card.dart';

class AddLessonScreen extends StatefulWidget {
  final String? courseId;

  const AddLessonScreen({super.key, this.courseId});

  @override
  State<AddLessonScreen> createState() => _AddLessonScreenState();
}

class _AddLessonScreenState extends State<AddLessonScreen> {
  final _lessonTitleController = TextEditingController();
  final _durationController = TextEditingController();
  bool _isFreePreview = false;

  @override
  void dispose() {
    _lessonTitleController.dispose();
    _durationController.dispose();
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
          'Add Lesson',
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
            CustomTextInput(
              label: 'Lesson Title',
              hint: 'e.g., Introduction to Figma Components',
              controller: _lessonTitleController,
            ),
            const SizedBox(height: 20),
            CustomTextInput(
              label: 'Estimated Duration',
              hint: '20',
              controller: _durationController,
              keyboardType: TextInputType.number,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Align(
                  widthFactor: 1,
                  alignment: Alignment.centerRight,
                  child: Text(
                    'minutes',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: InstructorDesign.textSecondary,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: InstructorDesign.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: InstructorDesign.chipInactiveBg),
                boxShadow: InstructorDesign.cardShadow(context),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Free Preview',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            color: InstructorDesign.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Offer a preview to prospective students',
                          style: TextStyle(
                            fontSize: 12,
                            color: InstructorDesign.textSecondary.withValues(alpha: 0.95),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Switch.adaptive(
                    value: _isFreePreview,
                    onChanged: (v) => setState(() => _isFreePreview = v),
                    activeThumbColor: Colors.white,
                    activeTrackColor: InstructorDesign.primary,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'LESSON CONTENT',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
                color: InstructorDesign.textTertiary,
              ),
            ),
            const SizedBox(height: 14),
            DashedBorderContainer(
              backgroundColor: InstructorDesign.surfaceMuted,
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: InstructorDesign.primary.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.cloud_upload_outlined,
                      size: 28,
                      color: InstructorDesign.primary,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Upload Video or Materials',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      color: InstructorDesign.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'MP4, PDF, or ZIP — max 500MB',
                    style: TextStyle(
                      fontSize: 12,
                      color: InstructorDesign.textSecondary.withValues(alpha: 0.95),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: UploadAreaCard(
                    title: '+ Create Assignment',
                    subtitle: 'Hands-on tasks',
                    iconData: Icons.assignment_outlined,
                    iconBackgroundColor: const Color(0xFFFFF5EB),
                    iconColor: const Color(0xFFEA580C),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.createAssignment,
                        arguments: {'courseId': widget.courseId},
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: UploadAreaCard(
                    title: '+ Create Quiz',
                    subtitle: 'Knowledge checks',
                    iconData: Icons.quiz_outlined,
                    iconBackgroundColor: const Color(0xFFE0F2FE),
                    iconColor: const Color(0xFF2563EB),
                    onTap: () => Navigator.pushNamed(context, AppRoutes.createQuiz),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            PrimaryButton(
              label: 'SAVE LESSON',
              icon: const Icon(Icons.check_rounded, size: 20),
              onPressed: () {
                if (_lessonTitleController.text.isEmpty ||
                    _durationController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill required fields')),
                  );
                  return;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Lesson saved')),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
