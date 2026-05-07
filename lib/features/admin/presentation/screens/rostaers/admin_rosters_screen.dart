import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class AdminModerationScreen extends StatelessWidget {
  const AdminModerationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const Icon(Icons.arrow_back),
        title: const Text("LMS Admin", style: AppTextTheme.headingMD),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 16),
          Icon(Icons.settings),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("CONTENT MANAGEMENT", style: AppTextTheme.headingLG),
            const Text("Manage and approve academic content", style: AppTextTheme.bodyRegular),

            AppSpacing.verticalLg,

            // Tab Filter
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  _buildTab("PENDING", true),
                  _buildTab("DRAFT", false),
                  _buildTab("PUBLISHED", false),
                ],
              ),
            ),

            AppSpacing.verticalLg,

            // Course Cards
            _buildCourseCard(
              imageUrl: "https://picsum.photos/id/1015/300/200",
              title: "Advanced Architectural Visualization",
              instructor: "Dr. Helena Thorne",
              status: "NEEDS REVIEW",
              statusColor: Colors.red,
            ),

            AppSpacing.verticalMd,

            _buildCourseCard(
              imageUrl: "https://picsum.photos/id/201/300/200",
              title: "Cybersecurity Ethics",
              instructor: "Prof. Marcus Chen",
              status: "NEEDS REVIEW",
              statusColor: Colors.red,
            ),

            AppSpacing.verticalMd,

            _buildCourseCard(
              imageUrl: "https://picsum.photos/id/237/300/200",
              title: "Classical Literature",
              instructor: "Instructor Sarah Miller",
              status: "DRAFT SAVED",
              statusColor: Colors.green,
              isDraft: true,
            ),

            AppSpacing.verticalXl,

            const Center(
              child: Text(
                "ALL COURSES REVIEWED FOR TODAY",
                style: AppTextTheme.bodyMedium,
              ),
            ),

            AppSpacing.verticalLg,

            // Floating Action Button
            Align(
              alignment: Alignment.centerRight,
              child: FloatingActionButton(
                backgroundColor: const Color(0xFF22C55E),
                onPressed: () {},
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, bool selected) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          boxShadow: selected
              ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)]
              : null,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
              color: selected ? AppColors.textPrimary : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCourseCard({
    required String imageUrl,
    required String title,
    required String instructor,
    required String status,
    required Color statusColor,
    bool isDraft = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 160,
                color: Colors.grey[300],
                child: const Icon(Icons.image, size: 60),
              ),
            ),
          ),
          AppSpacing.verticalMd,

          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),

          AppSpacing.verticalSm,
          Text(title, style: AppTextTheme.headingMD),
          Text(instructor, style: AppTextTheme.bodyMedium),

          if (!isDraft) ...[
            AppSpacing.verticalMd,
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF22C55E),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("APPROVE"),
                  ),
                ),
                AppSpacing.horizontalSm,
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("REJECT"),
                  ),
                ),
              ],
            ),
          ] else
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text("VIEW DRAFT"),
              ),
            ),
        ],
      ),
    );
  }
}