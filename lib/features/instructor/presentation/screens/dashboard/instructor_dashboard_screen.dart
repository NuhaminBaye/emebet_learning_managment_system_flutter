import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class InstructorDashboardScreen extends StatelessWidget {
  const InstructorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text("The Digital Atelier", style: AppTextTheme.headingMD),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Bonjour, Julian.", style: AppTextTheme.headingLG),
            AppSpacing.verticalSm,
            const Text("INSTRUCTOR OVERVIEW", style: AppTextTheme.bodySmall),

            AppSpacing.verticalLg,

            // Earnings Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF22C55E),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.attach_money, size: 40, color: Colors.white),
                  AppSpacing.horizontalMd,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("\$14,280", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
                      Text("MONTHLY EARNINGS", style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text("WITHDRAW", style: TextStyle(color: Color(0xFF22C55E), fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),

            AppSpacing.verticalLg,

            // Stats Row
            Row(
              children: [
                _buildStatCard("1,842", "ACTIVE STUDENTS", "5+ this week"),
                AppSpacing.horizontalMd,
                _buildStatCard("12", "LIVE COURSES", "3 draft made"),
              ],
            ),

            AppSpacing.verticalLg,

            // Recent Activity
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Recent Activity", style: AppTextTheme.headingMD),
                TextButton(onPressed: () {}, child: const Text("View All Journal")),
              ],
            ),
            AppSpacing.verticalSm,

            _buildActivityItem("New Enrollment", "UI/UX Principles", "2 hours ago"),
            _buildActivityItem("Submission", "Midterm Portfolio", "4 hours ago"),
            _buildActivityItem("Course Completed", "Typography Masterclass", "1 day ago"),

            AppSpacing.verticalLg,

            // Alerts Center
            const Text("Alerts Center", style: AppTextTheme.headingMD),
            AppSpacing.verticalSm,
            _buildAlertItem("System Update", "Check your original fonts link..."),
            _buildAlertItem("Payout Processing", "Your last payout has been sent..."),
            _buildAlertItem("Student Query", "Sarah Miller asked a question in Module 4..."),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label, String subtitle) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: AppTextTheme.headingLG),
            Text(label, style: AppTextTheme.bodyMedium),
            Text(subtitle, style: AppTextTheme.bodySmall),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem(String title, String subtitle, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(radius: 20, backgroundColor: Colors.grey),
          AppSpacing.horizontalMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
                Text(subtitle, style: AppTextTheme.bodySmall),
              ],
            ),
          ),
          Text(time, style: AppTextTheme.bodySmall),
        ],
      ),
    );
  }

  Widget _buildAlertItem(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.notifications_active, color: Colors.orange),
          AppSpacing.horizontalMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
                Text(subtitle, style: AppTextTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}