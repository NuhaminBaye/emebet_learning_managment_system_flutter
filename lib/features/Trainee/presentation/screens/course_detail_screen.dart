import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/core/theme/app_radius.dart';
import 'package:lms_mobileapp/core/theme/app_shadows.dart';
import 'package:lms_mobileapp/features/Trainee/domain/entities/course.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/course_deatil/course_detail_bloc.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/course_deatil/course_detail_event.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/course_deatil/course_detail_state.dart';
import 'package:lms_mobileapp/shared/widgets/buttons/enroll_bottom_bar.dart';
import 'package:lms_mobileapp/shared/widgets/common/app_page_state.dart';
import 'package:lms_mobileapp/shared/widgets/layout/course_hero.dart';
import 'package:lms_mobileapp/shared/widgets/tabs/course_tab.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CourseDetailBloc()..add(LoadCourseDetail()),
      child: const _CourseDetailView(),
    );
  }
}

class _CourseDetailView extends StatefulWidget {
  const _CourseDetailView();

  @override
  State<_CourseDetailView> createState() => _CourseDetailViewState();
}

class _CourseDetailViewState extends State<_CourseDetailView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailBloc, CourseDetailState>(
      builder: (context, state) {
        if (state is CourseDetailLoading || state is CourseDetailInitial) {
          return const Scaffold(body: AppLoadingState());
        }
        if (state is CourseDetailError) {
          return Scaffold(
            body: AppEmptyState(title: 'Unable to load course', message: state.message),
          );
        }

        final course = (state as CourseDetailLoaded).course;
        return Scaffold(
          backgroundColor: AppColors.background,
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [CourseHero(course: course)],
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CourseSummary(course: course),
                CourseTabs(tabController: _tabController),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _OverviewTab(course: course),
                      _LessonsTab(course: course),
                      _ReviewsTab(course: course),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: EnrollBottomBar(price: course.price),
        );
      },
    );
  }
}

class _CourseSummary extends StatelessWidget {
  const _CourseSummary({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(course.title, style: AppTextTheme.headingLG.copyWith(fontSize: 30)),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star_rounded, color: Color(0xFFFAB005), size: 18),
              const SizedBox(width: 4),
              Text(
                '${course.rating} (${course.reviewCount} reviews)',
                style: AppTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            course.instructor,
            style: AppTextTheme.bodyMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _OverviewTab extends StatelessWidget {
  const _OverviewTab({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
      children: [
        Text(
          'Course Description',
          style: AppTextTheme.headingMD.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Text(course.description, style: AppTextTheme.bodyMedium.copyWith(height: 1.55)),
        AppSpacing.verticalLg,
        Text(
          'What you will learn',
          style: AppTextTheme.headingMD.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        ...course.learningPoints.map(
          (point) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Icon(
                    Icons.check_circle_rounded,
                    color: AppColors.primary,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(child: Text(point, style: AppTextTheme.bodyMedium)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _LessonsTab extends StatelessWidget {
  const _LessonsTab({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
      itemCount: course.modules.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final module = course.modules[index];
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: module.isLocked ? const Color(0xFFF3F7F1) : AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.md),
            boxShadow: const [AppShadows.card],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: module.isLocked ? AppColors.grey200 : AppColors.primaryLight,
                child: Icon(
                  module.isLocked ? Icons.lock_outline_rounded : Icons.play_arrow_rounded,
                  color: module.isLocked ? AppColors.grey500 : AppColors.primary,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      module.title,
                      style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${module.duration} • ${module.lessonCount} lessons',
                      style: AppTextTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              if (!module.isLocked)
                const Icon(Icons.equalizer_rounded, color: AppColors.primary)
              else
                const Icon(Icons.lock_outline_rounded, color: AppColors.grey500),
            ],
          ),
        );
      },
    );
  }
}

class _ReviewsTab extends StatelessWidget {
  const _ReviewsTab({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
      children: [
        Row(
          children: [
            Text(course.rating, style: AppTextTheme.headingLG.copyWith(fontSize: 44)),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: List.generate(
                    5,
                    (_) => const Icon(
                      Icons.star_rounded,
                      size: 17,
                      color: Color(0xFFFAB005),
                    ),
                  ),
                ),
                Text('${course.reviewCount} reviews', style: AppTextTheme.bodySmall),
              ],
            ),
          ],
        ),
        AppSpacing.verticalMd,
        const _ReviewCard(
          name: 'Sarah Mitchell',
          age: '2 days ago',
          text:
              'This course exceeded my expectations. The module structure made complex topics easy to digest for beginners.',
        ),
        const SizedBox(height: 10),
        const _ReviewCard(
          name: 'Alex Rivera',
          age: '1 week ago',
          text:
              'Excellent video quality and clear explanations. I would love more advanced assignments in later modules.',
        ),
      ],
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({
    required this.name,
    required this.age,
    required this.text,
  });

  final String name;
  final String age;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.primaryLight,
                child: Text(name[0]),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w700)),
                    Text(age, style: AppTextTheme.bodySmall),
                  ],
                ),
              ),
              Row(
                children: List.generate(
                  5,
                  (_) => const Icon(Icons.star_rounded, size: 14, color: Color(0xFFFAB005)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(text, style: AppTextTheme.bodyMedium),
        ],
      ),
    );
  }
}
