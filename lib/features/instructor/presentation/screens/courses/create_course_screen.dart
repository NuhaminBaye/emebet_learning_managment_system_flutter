import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';
import 'package:lms_mobileapp/features/instructor/presentation/bloc/create_course/create_course_bloc.dart';
import 'package:lms_mobileapp/features/instructor/presentation/bloc/create_course/create_course_event.dart';
import 'package:lms_mobileapp/features/instructor/presentation/bloc/create_course/create_course_state.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/dashed_border_container.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/instructor_chrome_app_bar.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/instructor_step_card.dart';

class CreateCourseScreen extends StatelessWidget {
  const CreateCourseScreen({super.key});

  static const _disciplines = <String>[
    'Architecture',
    'Industrial Design',
    'UI / UX',
    'Photography',
    'Business',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateCourseBloc(),
      child: const _CreateCourseView(),
    );
  }
}

class _CreateCourseView extends StatefulWidget {
  const _CreateCourseView();

  @override
  State<_CreateCourseView> createState() => _CreateCourseViewState();
}

class _CreateCourseViewState extends State<_CreateCourseView> {
  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final _priceCtrl = TextEditingController(text: '0.00');
  String? _discipline = CreateCourseScreen._disciplines.first;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<CreateCourseBloc>().add(
            CreateCourseDisciplineChanged(_discipline),
          );
    });
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _priceCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDiscipline(BuildContext context) async {
    final chosen = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: InstructorDesign.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: InstructorDesign.textTertiary.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Select a Discipline',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              ...CreateCourseScreen._disciplines.map(
                (d) => ListTile(
                  title: Text(d),
                  trailing: _discipline == d
                      ? const Icon(Icons.check, color: InstructorDesign.primary)
                      : null,
                  onTap: () => Navigator.pop(ctx, d),
                ),
              ),
            ],
          ),
        );
      },
    );
    if (chosen == null || !context.mounted) return;
    setState(() => _discipline = chosen);
    context.read<CreateCourseBloc>().add(CreateCourseDisciplineChanged(chosen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InstructorDesign.canvas,
      appBar: const InstructorChromeAppBar(showBackWhenCanPop: true),
      body: BlocConsumer<CreateCourseBloc, CreateCourseState>(
        listenWhen: (previous, current) =>
            previous.status != current.status &&
            (current.status == CreateCourseStatus.success ||
                current.status == CreateCourseStatus.failure),
        listener: (context, state) {
          if (state.status == CreateCourseStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Saved')),
            );
          } else if (state.status == CreateCourseStatus.failure &&
              state.message != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message!)),
            );
          }
        },
        builder: (context, state) {
          final prof = state.draft.proficiency;
          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
            children: [
              const Text(
                'Create Course',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: InstructorDesign.textPrimary,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Design a learning experience that inspires. Every detail, from your '
                'curriculum to the thumbnail, defines your brand\'s craft.',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: InstructorDesign.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              InstructorStepCard(
                stepLabel: 'STEP 01',
                title: 'Foundation',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _fieldLabel('Title'),
                    const SizedBox(height: 8),
                    _textField(
                      controller: _titleCtrl,
                      hint: 'e.g. Modern Architectural Masterclass',
                      onChanged: (v) => context
                          .read<CreateCourseBloc>()
                          .add(CreateCourseTitleChanged(v)),
                    ),
                    const SizedBox(height: 16),
                    _fieldLabel('Description'),
                    const SizedBox(height: 8),
                    _textField(
                      controller: _descCtrl,
                      hint: 'Describe the journey your students will take...',
                      maxLines: 5,
                      onChanged: (v) => context
                          .read<CreateCourseBloc>()
                          .add(CreateCourseDescriptionChanged(v)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              InstructorStepCard(
                stepLabel: 'STEP 02',
                title: 'Classification',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _fieldLabel('Hierarchy & Category'),
                    const SizedBox(height: 8),
                    Material(
                      color: InstructorDesign.surface,
                      borderRadius: BorderRadius.circular(InstructorDesign.radiusControl),
                      child: InkWell(
                        borderRadius:
                            BorderRadius.circular(InstructorDesign.radiusControl),
                        onTap: () => _pickDiscipline(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(InstructorDesign.radiusControl),
                            border: Border.all(
                              color: InstructorDesign.chipInactiveBg,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _discipline ?? 'Select a Discipline',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: InstructorDesign.textPrimary,
                                  ),
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_down_rounded,
                                  color: InstructorDesign.primary),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    _fieldLabel('Target Proficiency'),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: ['Beginner', 'Intermediate', 'Advanced']
                          .map(
                            (level) => _ProficiencyChip(
                              label: level,
                              selected: prof == level,
                              onTap: () => context.read<CreateCourseBloc>().add(
                                    CreateCourseProficiencyChanged(level),
                                  ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              InstructorStepCard(
                stepLabel: 'STEP 03',
                title: 'Valuation',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _fieldLabel('Enrollment Fee (USD)'),
                    const SizedBox(height: 8),
                    _textField(
                      controller: _priceCtrl,
                      hint: '0.00',
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      prefixText: r'$ ',
                      prefixStyle: const TextStyle(
                        fontWeight: FontWeight.w800,
                        color: InstructorDesign.primary,
                        fontSize: 16,
                      ),
                      onChanged: (v) => context
                          .read<CreateCourseBloc>()
                          .add(CreateCoursePriceChanged(v)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              InstructorStepCard(
                stepLabel: 'STEP 04',
                title: 'Curriculum Builder',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: InstructorDesign.primary.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(Icons.cast_for_education_outlined,
                              color: InstructorDesign.primary),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Structure your knowledge',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: InstructorDesign.textPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Create a comprehensive learning path by organizing lessons into '
                      'modules. Add assignments, quizzes, and downloadable resources to '
                      'deepen the student experience.',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.45,
                        color: InstructorDesign.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.curriculumBuilder);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: InstructorDesign.primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              InstructorDesign.radiusControl,
                            ),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Build Curriculum',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward_rounded, size: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              InstructorStepCard(
                stepLabel: 'STEP 05',
                title: 'Aesthetic',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DashedBorderContainer(
                      backgroundColor: InstructorDesign.surfaceMuted,
                      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
                      child: Column(
                        children: [
                          const Icon(Icons.image_outlined,
                              color: InstructorDesign.primary, size: 36),
                          const SizedBox(height: 10),
                          const Text(
                            'Upload Thumbnail',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color: InstructorDesign.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Recommended size: 1000×1000px, JPG or PNG',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: InstructorDesign.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '“A compelling image increases engagement by up to 48%.”',
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: InstructorDesign.textTertiary,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: state.status == CreateCourseStatus.submitting
                      ? null
                      : () => context
                          .read<CreateCourseBloc>()
                          .add(const CreateCoursePublishRequested()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: InstructorDesign.primary,
                    foregroundColor: Colors.white,
                    elevation: 6,
                    shadowColor: InstructorDesign.primary.withValues(alpha: 0.35),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(InstructorDesign.radiusControl),
                    ),
                  ),
                  child: state.status == CreateCourseStatus.submitting
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Publish Course',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: TextButton(
                  onPressed: state.status == CreateCourseStatus.submitting
                      ? null
                      : () => context
                          .read<CreateCourseBloc>()
                          .add(const CreateCourseSaveDraftRequested()),
                  child: const Text(
                    'Save as Draft',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: InstructorDesign.primary,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static Widget _fieldLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: InstructorDesign.textTertiary,
      ),
    );
  }

  static Widget _textField({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? prefixText,
    TextStyle? prefixStyle,
    ValueChanged<String>? onChanged,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      onChanged: onChanged,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        color: InstructorDesign.textPrimary,
      ),
      decoration: InputDecoration(
        hintText: hint,
        prefixText: prefixText,
        prefixStyle: prefixStyle,
        filled: true,
        fillColor: InstructorDesign.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: TextStyle(
          color: InstructorDesign.textTertiary.withValues(alpha: 0.85),
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(InstructorDesign.radiusControl),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(InstructorDesign.radiusControl),
          borderSide: const BorderSide(color: InstructorDesign.chipInactiveBg),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(InstructorDesign.radiusControl),
          borderSide: const BorderSide(color: InstructorDesign.primary, width: 1.4),
        ),
      ),
    );
  }
}

class _ProficiencyChip extends StatelessWidget {
  const _ProficiencyChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? InstructorDesign.primary : InstructorDesign.chipInactiveBg,
      borderRadius: BorderRadius.circular(InstructorDesign.radiusChip),
      child: InkWell(
        borderRadius: BorderRadius.circular(InstructorDesign.radiusChip),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: selected ? Colors.white : InstructorDesign.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
