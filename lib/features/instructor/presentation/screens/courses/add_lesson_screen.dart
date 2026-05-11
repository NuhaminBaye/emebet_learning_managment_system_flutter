import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/custom_text_input.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/primary_button.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/upload_area_card.dart';

class AddLessonScreen extends StatefulWidget {
  final String? courseId;

  const AddLessonScreen({
    super.key,
    this.courseId,
  });

  @override
  State<AddLessonScreen> createState() => _AddLessonScreenState();
}

class _AddLessonScreenState extends State<AddLessonScreen> {
  late TextEditingController _lessonTitleController;
  late TextEditingController _durationController;
  bool _isFreePreview = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _lessonTitleController = TextEditingController();
    _durationController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _lessonTitleController.dispose();
    _durationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Add Lesson',
          style: AppTextTheme.headingMD.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lesson Title Input
            CustomTextInput(
              label: 'Lesson Title',
              hint: 'e.g., Introduction to Figma Components',
              controller: _lessonTitleController,
            ),
            const SizedBox(height: AppSpacing.lg),

            // Estimated Duration Input
            CustomTextInput(
              label: 'Estimated Duration',
              hint: '20',
              controller: _durationController,
              keyboardType: TextInputType.number,
              suffixIcon: Container(
                padding: const EdgeInsets.only(right: AppSpacing.md),
                alignment: Alignment.center,
                child: Text(
                  'minutes',
                  style: AppTextTheme.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Free Preview Toggle
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.border,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Free Preview',
                        style: AppTextTheme.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Offer to let non-students view',
                        style: AppTextTheme.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: _isFreePreview,
                      onChanged: (value) {
                        setState(() {
                          _isFreePreview = value;
                        });
                      },
                      activeColor: AppColors.primary,
                      inactiveThumbColor: AppColors.disabled,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Lesson Content Section
            Text(
              'Lesson Content',
              style: AppTextTheme.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Upload Area with dashed border and icon
            _DashedBorderContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.xl,
                  horizontal: AppSpacing.lg,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD9F7E2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.cloud_upload_outlined,
                        size: 28,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      'Upload Video or Materials',
                      style: AppTextTheme.bodyMedium.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'MP4, PDF, or ZIP files supported (Max 500MB)',
                      style: AppTextTheme.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Action Cards Row
            Row(
              children: [
                Expanded(
                  child: UploadAreaCard(
                    title: '+ Create Assignment',
                    subtitle: 'Add hands-on tasks',
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
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: UploadAreaCard(
                    title: '+ Create Quiz',
                    subtitle: 'Test student knowledge',
                    iconData: Icons.quiz_outlined,
                    iconBackgroundColor: const Color(0xFFE0F2FE),
                    iconColor: const Color(0xFF2563EB),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Quiz creation coming soon'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),

            // Save Lesson Button
            PrimaryButton(
              label: 'Save Lesson',
              icon: const Icon(Icons.save, size: 20),
              onPressed: () {
                if (_lessonTitleController.text.isEmpty ||
                    _durationController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill all required fields'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Lesson saved successfully'),
                    duration: Duration(seconds: 2),
                  ),
                );

                // Navigate back
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }
}

class _DashedBorderContainer extends StatelessWidget {
  final Widget child;

  const _DashedBorderContainer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(color: const Color(0xFFC6D7D1)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  final Color color;

  _DashedBorderPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    const dashWidth = 8.0;
    const dashSpace = 8.0;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path();
    const radius = 20.0;
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(1.5, 1.5, size.width - 3, size.height - 3),
      const Radius.circular(radius),
    ));

    final dashPath = Path();
    for (final metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        final length = dashWidth;
        dashPath.addPath(
          metric.extractPath(distance, distance + length),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
