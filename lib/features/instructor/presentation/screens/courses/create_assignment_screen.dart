import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';
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
  late final TextEditingController _titleController;
  late final TextEditingController _instructionsController;
  late final TextEditingController _dueDateController;
  late final TextEditingController _pointsController;
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

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      _dueDateController.text =
          '${picked.month.toString().padLeft(2, '0')}/${picked.day.toString().padLeft(2, '0')}/${picked.year}';
      setState(() {});
    }
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
          'Create Assignment',
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    InstructorDesign.primary,
                    InstructorDesign.primary.withValues(alpha: 0.85),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(InstructorDesign.radiusCard),
                boxShadow: InstructorDesign.cardShadow(context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.courseName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.courseSection,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.88),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            CustomTextInput(
              label: 'Assignment Title',
              hint: 'e.g., Photosynthesis Lab Report',
              controller: _titleController,
            ),
            const SizedBox(height: 20),
            CustomTextInput(
              label: 'Detailed Instructions',
              hint: 'Learning objectives, deliverables, and rubric…',
              controller: _instructionsController,
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Due Date',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: InstructorDesign.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _dueDateController,
                        readOnly: true,
                        onTap: _selectDate,
                        decoration: _fieldDecoration(
                          hint: 'mm/dd/yyyy',
                          suffix: IconButton(
                            onPressed: _selectDate,
                            icon: const Icon(
                              Icons.calendar_today_outlined,
                              size: 18,
                              color: InstructorDesign.textTertiary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Points / Weight',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: InstructorDesign.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _pointsController,
                        keyboardType: TextInputType.number,
                        decoration: _fieldDecoration(
                          hint: '100',
                          suffixText: '%',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Reference Materials',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15,
                color: InstructorDesign.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            ..._referenceMaterials.map(
              (fileName) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: InstructorDesign.surface,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: InstructorDesign.chipInactiveBg),
                    boxShadow: InstructorDesign.cardShadow(context),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.picture_as_pdf_rounded,
                        color: Color(0xFFEF4444),
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fileName,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: InstructorDesign.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '2.4 MB • PDF',
                              style: TextStyle(
                                fontSize: 12,
                                color: InstructorDesign.textSecondary.withValues(alpha: 0.95),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() => _referenceMaterials.remove(fileName));
                        },
                        icon: const Icon(Icons.close_rounded,
                            color: InstructorDesign.textTertiary),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Open file picker (stub)')),
                  );
                },
                icon: const Icon(Icons.add_rounded, color: InstructorDesign.primary),
                label: const Text(
                  'Add Reference Material',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: InstructorDesign.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            PrimaryButton(
              label: 'SAVE ASSIGNMENT',
              icon: const Icon(Icons.save_rounded, size: 20),
              onPressed: () {
                if (_titleController.text.isEmpty ||
                    _instructionsController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please complete required fields')),
                  );
                  return;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Assignment saved')),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _fieldDecoration({
    required String hint,
    Widget? suffix,
    String? suffixText,
  }) {
    return InputDecoration(
      hintText: hint,
      suffixIcon: suffix,
      suffixText: suffixText,
      suffixStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        color: InstructorDesign.textSecondary,
      ),
      filled: true,
      fillColor: AppColors.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: InstructorDesign.chipInactiveBg),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: InstructorDesign.chipInactiveBg),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: InstructorDesign.primary, width: 1.5),
      ),
    );
  }
}
