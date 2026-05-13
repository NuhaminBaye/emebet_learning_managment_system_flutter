import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/Trainee/data/repositories/wishlist_repository.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/home/home_event.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/home/home_screen.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/home/home_bloc.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/profile/profile_bloc.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/profile/profile_event.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/wishlist/wishlist_event.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/search/search_screen.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/my_courses/my_courses_screen.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/wishlist/wishlist_screen.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/profile/profile_screen.dart';

class StudentShellScreen extends StatefulWidget {
  const StudentShellScreen({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<StudentShellScreen> createState() => _StudentShellScreenState();
}

class _StudentShellScreenState extends State<StudentShellScreen> {
  late int _currentIndex;
  final WishlistRepository _wishlistRepository = WishlistRepository();

  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    MyCoursesScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex.clamp(0, _screens.length - 1).toInt();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()..add(const LoadHomeContent())),
        BlocProvider(create: (_) => ProfileBloc()..add(LoadProfile())),
        BlocProvider(
          create: (_) => WishlistBloc(repository: _wishlistRepository)..add(const WishlistStarted()),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: IndexedStack(index: _currentIndex, children: _screens),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.surface,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
          selectedLabelStyle: AppTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w700),
          unselectedLabelStyle: AppTextTheme.bodySmall,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.book_rounded), label: 'My Courses'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_rounded), label: 'Wishlist'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}