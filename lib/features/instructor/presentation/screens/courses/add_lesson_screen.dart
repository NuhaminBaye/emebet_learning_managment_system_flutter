import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class AddLessonScreen extends StatefulWidget {
  const AddLessonScreen({super.key});

  @override
  State<AddLessonScreen> createState() => _AddLessonScreenState();
}

class _AddLessonScreenState extends State<AddLessonScreen> {
  bool _freePreview = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _durationController = TextEditingController(text: "20");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Add Lesson", style: AppTextTheme.headingMD),
        actions: [
          const CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=32"),
          ),
          AppSpacing.horizontalMd,
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lesson Title
            const Text("Lesson Title", style: AppTextTheme.bodyMedium),
            AppSpacing.verticalSm,
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "e.g. Introduction to Figma Components",
                filled: true,
                fillColor: const Color(0xFFF1F5F9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            AppSpacing.verticalLg,

            // Estimated Duration
            const Text("Estimated Duration", style: AppTextTheme.bodyMedium),
            AppSpacing.verticalSm,
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _durationController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF1F5F9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                AppSpacing.horizontalMd,
                const Text("minutes", style: AppTextTheme.bodyMedium),
              ],
            ),

            AppSpacing.verticalLg,

            // Free Preview
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Free Preview", style: AppTextTheme.bodyMedium),
                      Text("Allow users to view without enrolling", style: AppTextTheme.bodySmall),
                    ],
                  ),
                  const Spacer(),
                  Switch(
                    value: _freePreview,
                    onChanged: (val) => setState(() => _freePreview = val),
                    activeColor: AppColors.primary,
                  ),
                ],
              ),
            ),

            AppSpacing.verticalLg,

            // Lesson Content
             Text("LESSON CONTENT", style: AppTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w600)),
            AppSpacing.verticalSm,

            // Upload Area
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.grey200),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.cloud_upload_outlined, size: 48, color: Colors.grey),
                  AppSpacing.verticalSm,
                  const Text("Upload Video or Materials", style: AppTextTheme.bodyMedium),
                  const Text("MP4, PDF, or ZIP files supported (Max 500MB)", style: AppTextTheme.bodySmall),
                ],
              ),
            ),

            AppSpacing.verticalLg,

            // Action Cards
            Row(
              children: [
                Expanded(
                  child: _buildActionCard(
                    icon: Icons.assignment_outlined,
                    title: "+ Create Assignment",
                    subtitle: "Add hands-on tasks",
                  ),
                ),
                AppSpacing.horizontalMd,
                Expanded(
                  child: _buildActionCard(
                    icon: Icons.quiz_outlined,
                    title: "+ Create Quiz",
                    subtitle: "Test student knowledge",
                  ),
                ),
              ],
            ),

            AppSpacing.verticalXl,

            // Save Lesson Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.save),
                label: const Text("Save Lesson"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF22C55E),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: AppColors.primary),
          AppSpacing.verticalSm,
          Text(title, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
          Text(subtitle, style: AppTextTheme.bodySmall, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}