import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';
import 'package:lms_mobileapp/features/instructor/presentation/screens/alerts/alerts_screen.dart';
import 'package:lms_mobileapp/features/instructor/presentation/screens/courses/instructor_course_screen.dart';
import 'package:lms_mobileapp/features/instructor/presentation/screens/dashboard/instructor_dashboard_screen.dart';
import 'package:lms_mobileapp/features/instructor/presentation/screens/profile/instructor_profile_screen.dart';
import 'package:lms_mobileapp/features/instructor/presentation/screens/trainees/trainees_screen.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/instructor_pill_bottom_nav.dart';

class InstructorShellScreen extends StatefulWidget {
  const InstructorShellScreen({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<InstructorShellScreen> createState() => _InstructorShellScreenState();
}

class _InstructorShellScreenState extends State<InstructorShellScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex.clamp(0, 4);
  }

  static const List<Widget> _screens = [
    InstructorDashboardScreen(),
    InstructorCoursesScreen(),
    TraineesScreen(),
    AlertsScreen(),
    InstructorProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InstructorDesign.canvas,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: InstructorPillBottomNav(
        currentIndex: _currentIndex,
        onChanged: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}
