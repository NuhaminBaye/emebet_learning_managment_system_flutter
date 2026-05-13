import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';

import 'package:lms_mobileapp/features/Trainee/presentation/bloc/home/home_bloc.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/home/home_state.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/wishlist/wishlist_event.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/wishlist/wishlist_state.dart';

import 'package:lms_mobileapp/shared/widgets/media/avatar.dart';
import 'package:lms_mobileapp/shared/widgets/inputs/search_field.dart';
import 'package:lms_mobileapp/shared/widgets/layout/section_header.dart';
import 'package:lms_mobileapp/shared/widgets/cards/course_card.dart';
import 'package:lms_mobileapp/shared/widgets/chips/filter_chip.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading || state is HomeInitial) {
          return const Scaffold(
            backgroundColor: AppColors.background,
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is HomeError) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: Center(child: Text(state.message)),
          );
        }

        if (state is HomeLoaded) {
          final data = state;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  // Header
                  Row(
                    children: [
                      const AppAvatar(
                        imageUrl: 'https://ui-avatars.com/api/?name=Alex&background=23C55E&color=ffffff&size=128',
                        size: 36,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "EduStream",
                              style: AppTextTheme.bodyMedium.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text('Hello, ${data.name}!', style: AppTextTheme.headingMD),
                            Text(
                              'Ready to learn something new today?',
                              style: AppTextTheme.bodySmall.copyWith(color: AppColors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
                    ],
                  ),

                  AppSpacing.verticalLg,
                  SearchField(hintText: 'Search for courses, mentors...', onChanged: (value) {}),
                  AppSpacing.verticalLg,

                  _buildContinueLearning(context, data),
                  AppSpacing.verticalLg,

                  // Filters
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                          decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(24)),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.filter_alt, color: Colors.white, size: 18),
                              SizedBox(width: 8),
                              Text('Add Filters', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ),
                      ...data.filters.map((label) => AppFilterChip(label: label, selected: label == 'All Topics', onTap: () {})),
                    ],
                  ),

                  AppSpacing.verticalLg,
                  SectionHeader(title: 'Recommended for You', onSeeAll: () {}),
                  const SizedBox(height: 12),

                  // Recommended Courses
                  BlocBuilder<WishlistBloc, WishlistState>(
                    builder: (context, wishlistState) {
                      return SizedBox(
                        height: 246,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.recommendedCourses.length,
                          itemBuilder: (context, index) {
                            final item = data.recommendedCourses[index];
                            return CourseCard(
                              title: item.title,
                              instructor: item.instructor,
                              imageUrl: item.imageUrl,
                              price: item.price,
                              progressLabel: item.progressLabel,
                              isWishlisted: wishlistState.contains(item.id),
                              onTap: () => Navigator.pushNamed(context, AppRoutes.courseDetails),
                              onWishlistTap: () =>
                                  context.read<WishlistBloc>().add(WishlistToggled(item)),
                            );
                          },
                        ),
                      );
                    },
                  ),

                  AppSpacing.verticalLg,

                  // Upcoming Workshop
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF28C56A), Color(0xFF16A34A)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(color: AppColors.primary.withValues(alpha: 0.25), blurRadius: 20, offset: const Offset(0, 10)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('UPCOMING WORKSHOP',
                            style: AppTextTheme.bodySmall.copyWith(color: AppColors.textOnPrimary.withValues(alpha: 0.85), letterSpacing: 1.2)),
                        AppSpacing.verticalXs,
                        Text('Masterclass: Future of Generative AI in Design',
                            style: AppTextTheme.headingMD.copyWith(color: AppColors.textOnPrimary)),
                        AppSpacing.verticalXs,
                        Text('Saturday, Oct 24 · 10:00 AM EST',
                            style: AppTextTheme.bodyRegular.copyWith(color: AppColors.textOnPrimary.withValues(alpha: 0.9))),
                        AppSpacing.verticalLg,
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.surface,
                            foregroundColor: AppColors.textPrimary,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            minimumSize: const Size.fromHeight(50),
                          ),
                          child: const Text('Secure Your Spot'),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 100),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildContinueLearning(BuildContext context, HomeLoaded data) {
    final course = data.currentCourse;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 16, offset: const Offset(0, 8))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(16)),
                child: Text(course.category, style: AppTextTheme.bodySmall.copyWith(color: AppColors.primary)),
              ),
              const Spacer(),
              Text(course.progressLabel, style: AppTextTheme.bodyMedium.copyWith(color: AppColors.primary)),
            ],
          ),
          const SizedBox(height: 16),
          Text(course.title, style: AppTextTheme.headingMD.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text(course.subtitle, style: AppTextTheme.bodyRegular.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: LinearProgressIndicator(
              minHeight: 10,
              value: course.progress,
              backgroundColor: AppColors.grey100,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('12/16 lessons', style: AppTextTheme.bodySmall.copyWith(color: AppColors.textSecondary)),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, AppRoutes.courseDetails),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                ),
                child: Text(
                  course.progress > 0 ? 'Resume Lesson' : 'Start Course',
                  style: AppTextTheme.bodyMedium.copyWith(color: AppColors.textOnPrimary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}