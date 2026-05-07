import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class InstructorProfileScreen extends StatelessWidget {
  const InstructorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text("Profile", style: AppTextTheme.headingMD),
      ),
      body: SingleChildScrollView(
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
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=68"),
                      ),
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.verified, color: Colors.green, size: 28),
                      ),
                    ],
                  ),
                  AppSpacing.verticalMd,
                  const Text("Dr. Julian Sterling", style: AppTextTheme.headingLG),
                  const Text("Senior Architectural Designer", style: AppTextTheme.bodyMedium),
                ],
              ),
            ),

            // Stats
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStat("COURSES", "12"),
                  _buildStat("STUDENTS", "1.4k"),
                  _buildStat("RATING", "4.9 ★"),
                ],
              ),
            ),

            AppSpacing.verticalLg,

            // Account
            _buildSection("ACCOUNT", [
              _buildMenuItem(Icons.person_outline, "Edit Profile"),
              _buildMenuItem(Icons.lock_outline, "Change Password"),
            ]),

            // Preferences
            _buildSection("PREFERENCES", [
              _buildMenuItem(Icons.notifications_outlined, "Notifications"),
              _buildMenuItem(Icons.palette_outlined, "Appearance", trailing: const Text("LIGHT")),
            ]),

            // Support
            _buildSection("SUPPORT", [
              _buildMenuItem(Icons.help_outline, "Help Center"),
              _buildMenuItem(Icons.security, "Terms & Privacy"),
            ]),

            AppSpacing.verticalLg,

            // Logout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text("LOGOUT", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                  side: const BorderSide(color: Colors.red),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(value, style: AppTextTheme.headingLG),
        Text(label, style: AppTextTheme.bodySmall),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(title, style: AppTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w600)),
        ),
        ...items,
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {Widget? trailing}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.grey100)),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.textSecondary),
          AppSpacing.horizontalMd,
          Expanded(child: Text(title, style: AppTextTheme.bodyMedium)),
          if (trailing != null) trailing else const Icon(Icons.arrow_forward_ios, size: 18),
        ],
      ),
    );
  }
}