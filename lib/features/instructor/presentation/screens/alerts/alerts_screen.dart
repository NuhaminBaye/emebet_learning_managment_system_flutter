import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

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
        title: const Text("Alerts", style: AppTextTheme.headingMD),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("TODAY", style: AppTextTheme.bodySmall),

            AppSpacing.verticalSm,
            _buildAlertItem(
              icon: Icons.assignment,
              title: "New Submission",
              subtitle: "Elena Smith submitted Project 01 for the UI Design Fundamentals course.",
              time: "2m ago",
            ),
            _buildAlertItem(
              icon: Icons.chat_bubble_outline,
              title: "Student Message",
              subtitle: "David Chen sent a message about Module 2: Color Theory application.",
              time: "1h ago",
            ),
            _buildAlertItem(
              icon: Icons.school,
              title: "Enrollment Alert",
              subtitle: "Marcus Thorne just enrolled in your Advanced Prototyping masterclass.",
              time: "4h ago",
            ),

            AppSpacing.verticalLg,
            const Text("YESTERDAY", style: AppTextTheme.bodySmall),

            AppSpacing.verticalSm,
            _buildAlertItem(
              icon: Icons.publish,
              title: "Course Published",
              subtitle: "Your course \"Typography for Web\" is now live and available to all students.",
              time: "1d ago",
            ),
            _buildAlertItem(
              icon: Icons.star,
              title: "New Review",
              subtitle: "Sarah Jenkins left a 5-star review on your latest workshop session.",
              time: "1d ago",
            ),
            _buildAlertItem(
              icon: Icons.warning_amber_rounded,
              title: "Payment Issue",
              subtitle: "We were unable to process your monthly revenue payout. Please update your bank details.",
              time: "1d ago",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primary.withOpacity(0.1),
            child: Icon(icon, color: AppColors.primary, size: 24),
          ),
          AppSpacing.horizontalMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
                AppSpacing.verticalXs,
                Text(subtitle, style: AppTextTheme.bodySmall),
                AppSpacing.verticalSm,
                Text(time, style: AppTextTheme.bodySmall.copyWith(color: Colors.grey)),
              ],
            ),
          ),
          const Icon(Icons.circle, size: 10, color: Color(0xFF22C55E)),
        ],
      ),
    );
  }
}