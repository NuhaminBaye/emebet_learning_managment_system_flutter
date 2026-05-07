import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text("Assignment", style: AppTextTheme.headingMD),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text("Assignment:", style: TextStyle(fontSize: 16, color: Colors.grey)),
            const Text("Site Design Proposal", style: AppTextTheme.headingLG),
            const Text("Sept 30, 2025", style: AppTextTheme.bodyMedium),

            AppSpacing.verticalLg,

            // Project Overview
            const Text("Project Overview", style: AppTextTheme.headingMD),
            AppSpacing.verticalSm,
            const Text(
              "The Site Design Proposal is the foundational requirements of your final semester project. You are required to submit a comprehensive analysis of the chosen urban plot, including topographical mapping, solar orientation studies, and pedestrian flow diagrams.",
              style: AppTextTheme.bodyRegular,
            ),

            AppSpacing.verticalLg,

            // Submission Requirements
            const Text("Submission Requirements", style: AppTextTheme.headingMD),
            AppSpacing.verticalSm,
            _buildRequirementItem("Three page PDF document detailing the conceptual framework."),
            _buildRequirementItem("High-resolution site section (1:200 scale in TIFF or PDF format)."),
            _buildRequirementItem("Vegetation and materiality legend (Physical model photos accepted)."),

            AppSpacing.verticalLg,

            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                "https://images.unsplash.com/photo-1480714378408-67c0a6c0e0c7",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const Text("Site Analysis Perspective", style: AppTextTheme.bodySmall, textAlign: TextAlign.center),

            AppSpacing.verticalLg,

            // Your Submission
            const Text("Your Submission", style: AppTextTheme.headingMD),
            AppSpacing.verticalSm,
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.grey200),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.cloud_upload_outlined, size: 48, color: Colors.grey),
                  AppSpacing.verticalSm,
                  const Text("Drag & drop your files", style: AppTextTheme.bodyMedium),
                  const Text("or", style: AppTextTheme.bodySmall),
                  TextButton(onPressed: () {}, child: const Text("Browse Files")),
                ],
              ),
            ),

            AppSpacing.verticalLg,

            // Grading Criteria
            const Text("GRADING CRITERIA", style: AppTextTheme.bodySmall),
            _buildGradingRow("Conceptual Requirements", "40 pts"),
            _buildGradingRow("Technical Accuracy", "30 pts"),
            _buildGradingRow("Visual Presentation", "30 pts"),

            AppSpacing.verticalLg,

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF22C55E),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text("Submit Assignment", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),

            AppSpacing.verticalLg,
          ],
        ),
      ),
    );
  }

  Widget _buildRequirementItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
          AppSpacing.horizontalSm,
          Expanded(child: Text(text, style: AppTextTheme.bodyRegular)),
        ],
      ),
    );
  }

  Widget _buildGradingRow(String criteria, String points) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(criteria, style: AppTextTheme.bodyMedium),
          Text(points, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}