import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/profile/profile_bloc.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/profile/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ProfileView();
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if (state is ProfileLoaded) {
          final user = state.user;

          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              title: Text('Profile', style: AppTextTheme.headingMD.copyWith(color: AppColors.primary)),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 120),
              child: Column(
                children: [
                  // Profile Header
                  Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: user.avatarUrl,
                                width: 110,
                                height: 110,
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) => const CircleAvatar(
                                  radius: 55,
                                  child: Icon(Icons.person, size: 46),
                                ),
                              ),
                            ),
                            const CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.verified, color: Colors.green, size: 28),
                            ),
                          ],
                        ),
                        AppSpacing.verticalMd,
                        Text(user.fullName, style: AppTextTheme.headingLG),
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0x1A22C55E),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text("PREMIUM MEMBER", style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),

                  // Stats Row
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isCompact = constraints.maxWidth < 350;
                      return isCompact
                          ? Column(
                              children: [
                                Row(
                                  children: [
                                    _buildStatItem("12", "Courses Enrolled"),
                                    _buildStatItem("08", "Total Certificates"),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(children: [_buildStatItem("3.8", "Current GPA")]),
                              ],
                            )
                          : Row(
                              children: [
                                _buildStatItem("12", "Courses Enrolled"),
                                _buildStatItem("08", "Total Certificates"),
                                _buildStatItem("3.8", "Current GPA"),
                              ],
                            );
                    },
                  ),

                  AppSpacing.verticalLg,

                  // Personal Info
                  _buildSection("PERSONAL INFO", [
                    _buildInfoRow(Icons.person, "Full Name", user.fullName),
                    _buildInfoRow(Icons.email, "Email Address", user.email),
                    _buildInfoRow(Icons.description, "Biography", user.bio),
                  ]),

                  // Learning Preferences
                  _buildSection("LEARNING PREFERENCES", [
                    _buildToggleRow("Daily Reminders", true),
                    _buildToggleRow("New Course Alerts", true),
                    _buildToggleRow("Community Notifications", false),
                  ]),

                  // Security
                  _buildSection("SECURITY", [
                    _buildActionRow("Change Password", () {}),
                    _buildActionRow("Privacy Settings", () {}),
                  ]),

                  // Support
                  _buildSection("SUPPORT", [
                    _buildActionRow("Help Center", () {}),
                    _buildActionRow("About Lumina Academy", () {}),
                  ]),

                  AppSpacing.verticalLg,

                  // Logout
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.logout, color: Colors.red),
                        label: const Text("LOG OUT", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: const BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        }

        return const Scaffold(body: Center(child: Text("Error loading profile")));
      },
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(value, style: AppTextTheme.headingLG),
            Text(label, style: AppTextTheme.bodySmall, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
          child: Text(title, style: AppTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w600, letterSpacing: 1)),
        ),
        ...children,
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.grey100)),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.textSecondary),
          AppSpacing.horizontalMd,
          Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextTheme.bodySmall),
              Text(value, style: AppTextTheme.bodyMedium),
            ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleRow(String label, bool value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.grey100)),
      ),
      child: Row(
        children: [
          Expanded(child: Text(label, style: AppTextTheme.bodyMedium)),
          Switch(
            value: value,
            onChanged: (val) {},
            activeThumbColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow(String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: const BoxDecoration(
          color: AppColors.surface,
          border: Border(bottom: BorderSide(color: AppColors.grey100)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextTheme.bodyMedium),
            const Icon(Icons.arrow_forward_ios, size: 18),
          ],
        ),
      ),
    );
  }
}