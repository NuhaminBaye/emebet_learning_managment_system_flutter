import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/admin/presentation/screens/dashboard/admin_dashboard_screen.dart';
import 'package:lms_mobileapp/features/admin/presentation/screens/rostaers/admin_rosters_screen.dart';
// Add other screens later

class AdminShellScreen extends StatefulWidget {
  const AdminShellScreen({super.key});

  @override
  State<AdminShellScreen> createState() => _AdminShellScreenState();
}

class _AdminShellScreenState extends State<AdminShellScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    AdminDashboardScreen(),
    AdminModerationScreen(),
    PlaceholderScreen(label: "Access"),
    PlaceholderScreen(label: "Billing"),
    PlaceholderScreen(label: "Logs"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        selectedLabelStyle: AppTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w600),
        unselectedLabelStyle: AppTextTheme.bodySmall,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), label: 'Summary'),
          BottomNavigationBarItem(icon: Icon(Icons.people_outlined), label: 'Rosters'),
          BottomNavigationBarItem(icon: Icon(Icons.lock_outline), label: 'Access'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Billing'),
          BottomNavigationBarItem(icon: Icon(Icons.article_outlined), label: 'Logs'),
        ],
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String label;
  const PlaceholderScreen({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("$label Screen\nComing Soon")));
  }
}