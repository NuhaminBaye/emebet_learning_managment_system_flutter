import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/home/home_event.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/home/home_screen.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/home/home_bloc.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/search/search_screen.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/my_courses/my_courses_screen.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/wishlist/wishlist_screen.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/profile/profile_screen.dart';

class StudentShellScreen extends StatefulWidget {
  const StudentShellScreen({super.key});

  @override
  State<StudentShellScreen> createState() => _StudentShellScreenState();
}

class _StudentShellScreenState extends State<StudentShellScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    MyCoursesScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(const LoadHomeContent()),
      child: Scaffold(
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
          elevation: 16,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
          selectedLabelStyle: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600),
          unselectedLabelStyle: AppTextTheme.bodyMedium,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: 'My Courses'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Wishlist'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}