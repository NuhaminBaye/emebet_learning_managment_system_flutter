import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/instructor/presentation/screens/courses/instructor_course_screen.dart';
import 'package:lms_mobileapp/features/instructor/presentation/screens/dashboard/instructor_dashboard_screen.dart';
import 'package:lms_mobileapp/features/instructor/presentation/screens/trainees/trainees_screen.dart';
import 'package:lms_mobileapp/features/instructor/presentation/screens/alerts/alerts_screen.dart';
import 'package:lms_mobileapp/features/instructor/presentation/screens/profile/instructor_profile_screen.dart';

class InstructorShellScreen extends StatefulWidget {
  const InstructorShellScreen({super.key});

  @override
  State<InstructorShellScreen> createState() => _InstructorShellScreenState();
}

class _InstructorShellScreenState extends State<InstructorShellScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    InstructorDashboardScreen(),
    InstructorCoursesScreen(),
    TraineesScreen(),
    AlertsScreen(),
    InstructorProfileScreen(),
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
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.school_outlined), label: 'Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.people_outlined), label: 'Trainees'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_outlined), label: 'Alerts'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}