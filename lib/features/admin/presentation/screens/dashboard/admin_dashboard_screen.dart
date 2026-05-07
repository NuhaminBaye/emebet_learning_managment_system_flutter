import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text("LMS Admin", style: AppTextTheme.headingMD),
        actions: const [
          Icon(Icons.refresh),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Good Morning, Registrar", style: AppTextTheme.headingLG),
            const Text("SYSTEM OVERVIEW", style: AppTextTheme.bodySmall),

            AppSpacing.verticalLg,

            // Stats Cards
            Row(
              children: [
                Expanded(child: _buildStatCard("TOTAL USERS", "12.8k", "+12% this month", Colors.green)),
                AppSpacing.horizontalMd,
                Expanded(child: _buildStatCard("TOTAL COURSES", "156", "", Colors.blue)),
              ],
            ),

            AppSpacing.verticalMd,

            Row(
              children: [
                Expanded(child: _buildLargeStatCard("REVENUE", "\$48.2k", Colors.green)),
                AppSpacing.horizontalMd,
                Expanded(child: _buildStatCard("REPORTS", "Analytics →", "", Colors.purple)),
              ],
            ),

            AppSpacing.verticalLg,

            // Recent Activities
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Recent Activities", style: AppTextTheme.headingMD),
                TextButton(onPressed: () {}, child: const Text("VIEW ALL")),
              ],
            ),

            _buildActivityItem("Sarah Jenkins registered", "Professional Path • 2m ago", "NEW"),
            _buildActivityItem("Advanced UI Design submitted", "Awaiting Review • 45m ago", ""),
            _buildActivityItem("Payment completed: #8842", "Verified • 1h ago", "+ \$199"),

            AppSpacing.verticalLg,

            // Real-time Traffic
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("REAL-TIME TRAFFIC", style: AppTextTheme.headingMD),
                  const Text("LIVE NOW", style: TextStyle(color: Colors.green)),
                  AppSpacing.verticalMd,
                  // Placeholder for chart
                  Container(
                    height: 140,
                    color: Colors.grey[100],
                    child: const Center(child: Text("📊 Traffic Chart")),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("08:00 AM"),
                      Text("Peak 2.4k"),
                      Text("09:00 AM"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, String subtitle, Color accent) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextTheme.bodySmall),
          AppSpacing.verticalSm,
          Text(value, style: AppTextTheme.headingLG),
          if (subtitle.isNotEmpty) Text(subtitle),
        ],
      ),
    );
  }

  Widget _buildLargeStatCard(String title, String value, Color accent) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: accent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white70)),
          Text(value, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String title, String subtitle, String tag) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(radius: 20),
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
          if (tag.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(tag, style: const TextStyle(color: Colors.green, fontSize: 12)),
            ),
        ],
      ),
    );
  }
}