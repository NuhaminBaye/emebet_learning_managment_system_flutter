import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/core/theme/app_radius.dart';
import 'package:lms_mobileapp/features/Trainee/domain/entities/lesson.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/lesson_detail_bloc.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/lesson_detail_event.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/lesson_detail_state.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/my_courses/assignment_screen.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/my_courses/grade_analaytics_screen.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/my_courses/quiz_screen.dart';
import 'package:lms_mobileapp/shared/widgets/cards/discussion_item_card.dart';
import 'package:lms_mobileapp/shared/widgets/cards/lesson_content_card.dart';
import 'package:lms_mobileapp/shared/widgets/cards/resource_card.dart';
import 'package:lms_mobileapp/shared/widgets/common/app_page_state.dart';
import 'package:lms_mobileapp/shared/widgets/common/section_tab_bar.dart';

class LessonDetailScreen extends StatelessWidget {
  const LessonDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LessonDetailBloc()..add(LoadLessonDetail()),
      child: const _LessonDetailView(),
    );
  }
}

class _LessonDetailView extends StatefulWidget {
  const _LessonDetailView();

  @override
  State<_LessonDetailView> createState() => _LessonDetailViewState();
}

class _LessonDetailViewState extends State<_LessonDetailView>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonDetailBloc, LessonDetailState>(
      builder: (context, state) {
        if (state is LessonDetailLoading || state is LessonDetailInitial) {
          return const Scaffold(body: AppLoadingState());
        }
        if (state is LessonDetailError) {
          return Scaffold(
            body: AppEmptyState(title: 'Unable to load lesson', message: state.message),
          );
        }

        final lesson = (state as LessonDetailLoaded).lesson;
        return Scaffold(
          backgroundColor: AppColors.background,
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [_LessonHero(lesson: lesson)],
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lesson.moduleName,
                        style: AppTextTheme.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(lesson.title, style: AppTextTheme.headingLG.copyWith(fontSize: 34)),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppRadius.md),
                            ),
                          ),
                          child: const Text('Mark as Complete'),
                        ),
                      ),
                    ],
                  ),
                ),
                SectionTabBar(
                  controller: _controller,
                  tabs: const ['Content', 'Resources', 'Discussion'],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _controller,
                    children: [
                      _ContentTab(lesson: lesson),
                      _ResourcesTab(lesson: lesson),
                      const _DiscussionTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LessonHero extends StatelessWidget {
  const _LessonHero({required this.lesson});

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 212,
      pinned: true,
      backgroundColor: AppColors.textPrimary,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: lesson.thumbnailUrl,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const ColoredBox(color: AppColors.grey300),
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x10000000), Color(0x90000000)],
                ),
              ),
            ),
            const Center(
              child: CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.primary,
                child: Icon(Icons.play_arrow_rounded, color: Colors.white, size: 34),
              ),
            ),
          ],
        ),
      ),
      leading: IconButton(
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.StudentShellScreenState,
              arguments: {'index': 2},
            );
          }
        },
        icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.StudentShellScreenState,
              (route) => false,
              arguments: {'index': 3},
            );
          },
          icon: const Icon(Icons.favorite_border_rounded, color: Colors.white),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 14),
          child: Center(
            child: Text('12:45 / 18:20', style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ),
      ],
    );
  }
}

class _ContentTab extends StatelessWidget {
  const _ContentTab({required this.lesson});

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
      children: [
        Text(
          lesson.description,
          style: AppTextTheme.bodyMedium.copyWith(height: 1.55, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 16),
        Text('Key Learning Objectives', style: AppTextTheme.headingMD.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        ...lesson.objectives.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                const Icon(Icons.check_circle_outline_rounded, color: AppColors.primary, size: 18),
                const SizedBox(width: 8),
                Expanded(child: Text(item, style: AppTextTheme.bodyMedium)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 18),
        LessonContentCard(
          title: 'Assignments',
          subtitle: '3 Assignments',
          icon: Icons.assignment_outlined,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AssignmentScreen())),
        ),
        const SizedBox(height: 10),
        LessonContentCard(
          title: 'Take Quiz',
          subtitle: 'Final Quiz',
          icon: Icons.quiz_outlined,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizScreen())),
        ),
        const SizedBox(height: 10),
        LessonContentCard(
          title: 'Grade Analytics',
          subtitle: 'View Performance',
          icon: Icons.bar_chart_rounded,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GradeAnalyticsScreen())),
        ),
      ],
    );
  }
}

class _ResourcesTab extends StatelessWidget {
  const _ResourcesTab({required this.lesson});

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
      itemBuilder: (_, index) {
        final name = lesson.resources[index];
        final fileType = name.toLowerCase().endsWith('.pdf') ? 'PDF' : 'DOC';
        return ResourceCard(title: name, sizeLabel: '12.58 Mb', fileType: fileType);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: lesson.resources.length,
    );
  }
}

class _DiscussionTab extends StatelessWidget {
  const _DiscussionTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
      children: const [
        DiscussionItemCard(
          name: 'Marcus Chen',
          time: '2h ago',
          message:
              'How should I approach asymptotic analysis when nested loops have different growth rates?',
        ),
        SizedBox(height: 10),
        DiscussionItemCard(
          name: 'Sarah Jenkins',
          time: '1h ago',
          message: 'This lesson finally made reconciliation in the Virtual DOM click for me.',
        ),
        SizedBox(height: 10),
        DiscussionItemCard(
          name: 'Dr. Aris Thorne',
          time: '45m ago',
          message: 'Great question. Check the supplementary paper in resources for deeper complexity trade-offs.',
          isInstructor: true,
        ),
      ],
    );
  }
}
