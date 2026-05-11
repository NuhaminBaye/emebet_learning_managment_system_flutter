import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/custom_text_input.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/primary_button.dart';

class CreateAssignmentScreen extends StatefulWidget {
  final String? courseId;
  final String courseName;
  final String courseSection;

  const CreateAssignmentScreen({
    super.key,
    this.courseId,
    this.courseName = 'Advanced Botanical Science 102',
    this.courseSection = 'SECTION B • AUTUMN SEMESTER',
  });

  @override
  State<CreateAssignmentScreen> createState() => _CreateAssignmentScreenState();
}

class _CreateAssignmentScreenState extends State<CreateAssignmentScreen> {
  late TextEditingController _titleController;
  late TextEditingController _instructionsController;
  late TextEditingController _dueDateController;
  late TextEditingController _pointsController;
  final List<String> _referenceMaterials = ['Lab_Guidelines_2024.pdf'];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _instructionsController = TextEditingController();
    _dueDateController = TextEditingController();
    _pointsController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _instructionsController.dispose();
    _dueDateController.dispose();
    _pointsController.dispose();
    super.dispose();
  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      _dueDateController.text =
          '${picked.month.toString().padLeft(2, '0')}/${picked.day.toString().padLeft(2, '0')}/${picked.year}';
    }
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
          'Create Assignment',
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
            // Course Header Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF22C55E),
                    Color(0xFF16a34a),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF22C55E).withOpacity(0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.courseName,
                    style: AppTextTheme.headingMD.copyWith(
                      color: AppColors.textOnPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.courseSection,
                    style: AppTextTheme.bodySmall.copyWith(
                      color: AppColors.textOnPrimary.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),

            // Assignment Title Input
            CustomTextInput(
              label: 'Assignment Title',
              hint: 'e.g., Photosynthesis Lab Report',
              controller: _titleController,
            ),
            const SizedBox(height: AppSpacing.lg),

            // Detailed Instructions Input
            CustomTextInput(
              label: 'Detailed Instructions',
              hint: 'Describe the learning objectives and submission requirements...',
              controller: _instructionsController,
              maxLines: 5,
            ),
            const SizedBox(height: AppSpacing.lg),

            // Due Date and Points Row
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Due Date',
                        style: AppTextTheme.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _dueDateController,
                        readOnly: true,
                        onTap: _selectDate,
                        decoration: InputDecoration(
                          hintText: 'mm/dd/yyyy',
                          hintStyle: AppTextTheme.bodyMedium.copyWith(
                            color: AppColors.textDisabled,
                          ),
                          filled: true,
                          fillColor: AppColors.surface,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.border,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.border,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                              width: 2,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(AppSpacing.md),
                          suffixIcon: GestureDetector(
                            onTap: _selectDate,
                            child: const Icon(
                              Icons.calendar_today,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Points/Weight',
                        style: AppTextTheme.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _pointsController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '100',
                          hintStyle: AppTextTheme.bodyMedium.copyWith(
                            color: AppColors.textDisabled,
                          ),
                          filled: true,
                          fillColor: AppColors.surface,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.border,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.border,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                              width: 2,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(AppSpacing.md),
                          suffixIcon: Container(
                            padding: const EdgeInsets.only(right: AppSpacing.md),
                            alignment: Alignment.center,
                            child: Text(
                              '%',
                              style: AppTextTheme.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),

            // Reference Materials Section
            Text(
              'Reference Materials',
              style: AppTextTheme.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Reference Material Files List
            ..._referenceMaterials.map(
              (fileName) => Container(
                margin: const EdgeInsets.only(bottom: AppSpacing.md),
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.border,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.picture_as_pdf,
                      color: Color(0xFFEF4444),
                      size: 24,
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fileName,
                            style: AppTextTheme.bodyMedium.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '2.4 MB • PDF DOCUMENT',
                            style: AppTextTheme.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _referenceMaterials.remove(fileName);
                        });
                      },
                      child: const Icon(
                        Icons.close,
                        color: AppColors.textSecondary,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Add Reference Material Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Add reference material'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                icon: const Icon(Icons.add, size: 20),
                label: const Text('Add Reference Material'),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                  foregroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),

            // Save Assignment Button
            PrimaryButton(
              label: 'Save Assignment',
              icon: const Icon(Icons.save, size: 20),
              onPressed: () {
                if (_titleController.text.isEmpty ||
                    _instructionsController.text.isEmpty) {
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
                    content: Text('Assignment saved successfully'),
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