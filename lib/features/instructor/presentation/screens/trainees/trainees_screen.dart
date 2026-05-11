import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/shared/widgets/chips/filter_chip.dart';

class TraineesScreen extends StatefulWidget {
  const TraineesScreen({super.key});

  @override
  State<TraineesScreen> createState() => _TraineesScreenState();
}

class _TraineesScreenState extends State<TraineesScreen> {
  int _selectedFilter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text('Digital Atelier', style: AppTextTheme.headingMD),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Student Roster', style: AppTextTheme.headingLG),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Monitor individual student engagement and curriculum progress across the Digital Architecture cohort.',
              style: AppTextTheme.bodyRegular.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    title: 'TOTAL ENROLLED',
                    value: '128',
                    subtitle: '+12% this month',
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: _buildStatCard(
                    title: 'AVG. PROGRESSION',
                    value: '64%',
                    subtitle: '',
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            _buildStatCard(
              title: 'ACTIVE TODAY',
              value: '42',
              subtitle: '',
              showAvatars: true,
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                Expanded(
                  child: AppFilterChip(
                    label: 'All Students',
                    selected: _selectedFilter == 0,
                    onTap: () => setState(() => _selectedFilter = 0),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: AppFilterChip(
                    label: 'Active',
                    selected: _selectedFilter == 1,
                    onTap: () => setState(() => _selectedFilter = 1),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: AppFilterChip(
                    label: 'Completed',
                    selected: _selectedFilter == 2,
                    onTap: () => setState(() => _selectedFilter = 2),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Sort by: Last Active', style: AppTextTheme.bodyMedium),
                Icon(Icons.arrow_drop_down, color: AppColors.textPrimary),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            _buildStudentCard(
              name: 'Elena Smith',
              email: 'elena.s@atelier.edu',
              progress: 82,
              module: 'ADVANCED MODULE',
              statusLabel: 'UNASSIGNED SUBMISSION',
              actionLabel: 'Grade Now',
              actionColor: AppColors.primary,
              onActionTap: () =>
                  Navigator.pushNamed(context, AppRoutes.gradingPortal),
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildStudentCard(
              name: 'Marcus Liao',
              email: 'marcus.l@atelier.edu',
              progress: 45,
              module: 'FOUNDATION',
              statusLabel: 'VIEW RECENT SUBMISSION',
              actionLabel: 'View Submission',
              actionColor: Color(0xFF2563EB),
              onActionTap: () {},
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildStudentCard(
              name: 'Sarah Rodriguez',
              email: 'sarah.r@atelier.edu',
              progress: 17,
              module: 'INTRODUCTION',
              statusLabel: 'LOW ENGAGEMENT',
              actionLabel: 'Nudge Student',
              actionColor: Color(0xFFEF4444),
              onActionTap: () {},
            ),
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String subtitle,
    bool showAvatars = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey200.withOpacity(0.4),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextTheme.bodySmall.copyWith(
              color: AppColors.textSecondary,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            value,
            style: AppTextTheme.headingLG.copyWith(fontWeight: FontWeight.w700),
          ),
          if (subtitle.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(
              subtitle,
              style: AppTextTheme.bodySmall.copyWith(color: AppColors.primary),
            ),
          ],
          if (showAvatars) ...[
            const SizedBox(height: AppSpacing.sm),
            _buildAvatarsRow(),
          ],
        ],
      ),
    );
  }

  Widget _buildAvatarsRow() {
    const overlap = 20.0;
    return SizedBox(
      height: 40,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(left: 0, child: _buildAvatar(Colors.purple)),
          Positioned(left: overlap, child: _buildAvatar(Colors.blue)),
          Positioned(left: overlap * 2, child: _buildAvatar(Colors.pink)),
        ],
      ),
    );
  }

  Widget _buildAvatar(Color color) {
    return CircleAvatar(radius: 16, backgroundColor: color);
  }

  Widget _buildStudentCard({
    required String name,
    required String email,
    required int progress,
    required String module,
    required String statusLabel,
    required String actionLabel,
    required Color actionColor,
    required VoidCallback onActionTap,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey200.withOpacity(0.35),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: actionColor.withOpacity(0.15),
                child: Text(
                  name[0],
                  style: TextStyle(
                    color: actionColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextTheme.bodyMedium.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      email,
                      style: AppTextTheme.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: LinearProgressIndicator(
                              value: progress / 100,
                              minHeight: 8,
                              backgroundColor: AppColors.grey100,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          '$progress%',
                          style: AppTextTheme.bodySmall.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.grey100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        statusLabel,
                        style: AppTextTheme.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      module,
                      style: AppTextTheme.bodySmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: onActionTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: actionColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.sm,
                  ),
                ),
                child: Text(
                  actionLabel,
                  style: AppTextTheme.bodySmall.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
