import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/core/theme/app_radius.dart';
import 'package:lms_mobileapp/shared/widgets/buttons/primary_button.dart';
import 'package:lms_mobileapp/shared/widgets/cards/assignment_requirement_card.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        title: const Text("Assignment", style: AppTextTheme.headingMD),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text("ASSIGNMENT", style: AppTextTheme.bodySmall.copyWith(letterSpacing: 1, color: AppColors.textSecondary)),
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
            const AssignmentRequirementCard(
              text: "Three page PDF document detailing the conceptual framework.",
            ),
            const AssignmentRequirementCard(
              text: "High-resolution site section (1:200 scale in TIFF or PDF format).",
            ),
            const AssignmentRequirementCard(
              text: "Vegetation and materiality legend (Physical model photos accepted).",
            ),

            AppSpacing.verticalLg,

            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.md),
              child: CachedNetworkImage(
                imageUrl: "https://images.unsplash.com/photo-1480714378408-67c0a6c0e0c7",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const ColoredBox(color: AppColors.grey300),
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
                borderRadius: BorderRadius.circular(AppRadius.md),
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
            PrimaryButton(
              text: "Submit Assignment",
              onPressed: () {},
              height: 52,
              radius: AppRadius.md,
            ),

            AppSpacing.verticalLg,
          ],
        ),
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