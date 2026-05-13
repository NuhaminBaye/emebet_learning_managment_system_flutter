import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';
import 'package:lms_mobileapp/features/instructor/data/dtos/instructor_course_dto.dart';
import 'package:lms_mobileapp/features/instructor/data/repositories/mock_instructor_course_repository.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/instructor_chrome_app_bar.dart';

/// Course management: Draft / Published lists + create CTA (matches instructor mockups).
class InstructorCourseManagementScreen extends StatefulWidget {
  const InstructorCourseManagementScreen({super.key});

  @override
  State<InstructorCourseManagementScreen> createState() =>
      _InstructorCourseManagementScreenState();
}

class _InstructorCourseManagementScreenState
    extends State<InstructorCourseManagementScreen> {
  final _repository = MockInstructorCourseRepository();

  int _tab = 0;
  List<InstructorCourseDto> _courses = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final page = await _repository.listCourses(
      page: 0,
      pageSize: 50,
      draftsOnly: _tab == 0,
    );
    if (!mounted) return;
    setState(() {
      _courses = page.items;
      _loading = false;
    });
  }

  void _onTabChanged(int i) {
    setState(() => _tab = i);
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InstructorDesign.canvas,
      appBar: const InstructorChromeAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Course Management',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: InstructorDesign.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Curate drafts, publish learning paths, and grow your studio.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.45,
                      color: InstructorDesign.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _TabToggle(
                    selected: _tab,
                    onChanged: _onTabChanged,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          if (_loading)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final course = _courses[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _CourseCard(
                        course: course,
                        onView: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.curriculumBuilder,
                            arguments: {
                              'courseId': course.id,
                              'courseName': course.title,
                            },
                          );
                        },
                      ),
                    );
                  },
                  childCount: _courses.length,
                ),
              ),
            ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
            sliver: SliverToBoxAdapter(
              child: _CreateNewContentCard(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.createCourse);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabToggle extends StatelessWidget {
  const _TabToggle({required this.selected, required this.onChanged});

  final int selected;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: InstructorDesign.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: InstructorDesign.cardShadow(context),
      ),
      child: Row(
        children: [
          Expanded(
            child: _TabButton(
              label: 'Draft',
              selected: selected == 0,
              onTap: () => onChanged(0),
            ),
          ),
          Expanded(
            child: _TabButton(
              label: 'Published',
              selected: selected == 1,
              onTap: () => onChanged(1),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 160),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: selected ? InstructorDesign.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: selected
                      ? InstructorDesign.surface
                      : InstructorDesign.textTertiary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  const _CourseCard({required this.course, required this.onView});

  final InstructorCourseDto course;
  final VoidCallback onView;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: InstructorDesign.surface,
        borderRadius: BorderRadius.circular(InstructorDesign.radiusCard),
        boxShadow: InstructorDesign.cardShadow(context),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 10,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: course.coverImageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: InstructorDesign.surfaceMuted,
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: InstructorDesign.surfaceMuted,
                    alignment: Alignment.center,
                    child: const Icon(Icons.image_not_supported_outlined),
                  ),
                ),
                Positioned(
                  left: 12,
                  top: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: InstructorDesign.surface.withValues(alpha: 0.92),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      course.category.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.6,
                        color: InstructorDesign.textPrimary,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: course.isDraft
                          ? Colors.orange.shade700
                          : InstructorDesign.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      course.isDraft ? 'DRAFT' : 'LIVE',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: InstructorDesign.textPrimary,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.people_alt_outlined,
                        size: 18, color: InstructorDesign.textSecondary),
                    const SizedBox(width: 6),
                    Text(
                      '${course.studentCount} students',
                      style: const TextStyle(
                        fontSize: 13,
                        color: InstructorDesign.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.star_rounded,
                        size: 20, color: Color(0xFFF2C94C)),
                    const SizedBox(width: 4),
                    Text(
                      course.rating > 0 ? course.rating.toStringAsFixed(1) : '—',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: InstructorDesign.textPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: OutlinedButton(
                    onPressed: onView,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: InstructorDesign.primary,
                      side: const BorderSide(color: InstructorDesign.primary, width: 1.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'VIEW',
                      style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.6),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CreateNewContentCard extends StatelessWidget {
  const _CreateNewContentCard({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: InstructorDesign.primary,
      borderRadius: BorderRadius.circular(InstructorDesign.radiusCard),
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(InstructorDesign.radiusCard),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create New Content',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Author a course, workshop, or masterclass.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.white, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
