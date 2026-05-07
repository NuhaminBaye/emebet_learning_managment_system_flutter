import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class CreateAssignmentScreen extends StatelessWidget {
  const CreateAssignmentScreen({super.key});

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
        title: const Text("Create Assignment", style: AppTextTheme.headingMD),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF22C55E),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Advanced Botanical Science 102", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  const Text("SECTION B • AUTUMN SEMESTER", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),

            AppSpacing.verticalLg,

            const Text("ASSIGNMENT TITLE", style: AppTextTheme.bodySmall),
            AppSpacing.verticalSm,
            TextField(
              decoration: InputDecoration(
                hintText: "e.g., Photosynthesis Lab Report",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: AppColors.surface,
              ),
            ),

            AppSpacing.verticalLg,

            const Text("DETAILED INSTRUCTIONS", style: AppTextTheme.bodySmall),
            AppSpacing.verticalSm,
            TextField(
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "Describe the learning objectives and submission requirements...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: AppColors.surface,
              ),
            ),

            AppSpacing.verticalLg,

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("DUE DATE", style: AppTextTheme.bodySmall),
                      AppSpacing.verticalSm,
                      TextField(
                        decoration: InputDecoration(
                          hintText: "mm/dd/yyyy",
                          suffixIcon: const Icon(Icons.calendar_today),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          filled: true,
                          fillColor: AppColors.surface,
                        ),
                      ),
                    ],
                  ),
                ),
                AppSpacing.horizontalMd,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("POINTS/WEIGHT", style: AppTextTheme.bodySmall),
                      AppSpacing.verticalSm,
                      TextField(
                        decoration: InputDecoration(
                          hintText: "100",
                          suffixIcon: const Icon(Icons.percent),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          filled: true,
                          fillColor: AppColors.surface,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            AppSpacing.verticalLg,

            const Text("REFERENCE MATERIALS", style: AppTextTheme.bodySmall),
            AppSpacing.verticalSm,

            // Uploaded File
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.picture_as_pdf, color: Colors.red),
                  AppSpacing.horizontalMd,
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Lab_Guidelines_2024.pdf"),
                        Text("2.4 MB • PDF DOCUMENT", style: AppTextTheme.bodySmall),
                      ],
                    ),
                  ),
                  const Icon(Icons.close),
                ],
              ),
            ),

            AppSpacing.verticalSm,

            // Add Reference Material
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Add Reference Material"),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
                side: const BorderSide(color: Color(0xFF22C55E)),
                foregroundColor: const Color(0xFF22C55E),
              ),
            ),

            AppSpacing.verticalXl,

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.save),
                label: const Text("SAVE ASSIGNMENT"),
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
}