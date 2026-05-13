import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/grade_analaytics_bloc.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/grade_analaytics_event.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/grade_analaytics_state.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/my_courses/certeficate_screen.dart';
import 'package:lms_mobileapp/shared/widgets/buttons/primary_button.dart';

class GradeAnalyticsScreen extends StatelessWidget {
  const GradeAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GradeAnalyticsBloc()..add(LoadGradeAnalytics()),
      child: const _GradeAnalyticsView(),
    );
  }
}

class _GradeAnalyticsView extends StatelessWidget {
  const _GradeAnalyticsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GradeAnalyticsBloc, GradeAnalyticsState>(
      builder: (context, state) {
        if (state is GradeAnalyticsLoading || state is GradeAnalyticsInitial) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (state is GradeAnalyticsError) {
          return Scaffold(body: Center(child: Text(state.message)));
        }

        final data = (state as GradeAnalyticsLoaded).data;
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            title: const Text('Your Academic Performance'),
            centerTitle: false,
          ),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 120),
            children: [
              Text(
                'Track your creative journey and technical mastery. Your progress reflects a commitment to the craft of modern design.',
                style: AppTextTheme.bodySmall.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(child: _MetricCard(value: '${data.gpa}', label: 'GPA', caption: 'OVERALL SCORE')),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _MetricCard(
                      value: '${data.creditsCompleted}',
                      label: 'Credits',
                      caption: 'TOTAL CREDITS',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              _Panel(
                title: 'Progress Over Time',
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 110,
                      child: CustomPaint(
                        painter: _SimpleLinePainter(),
                        size: const Size(double.infinity, 110),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              _Panel(
                title: 'Component Breakdown',
                child: Column(
                  children: [
                    _ProgressRow(name: 'Assignments', value: 0.92),
                    _ProgressRow(name: 'Quizzes', value: 0.89),
                    _ProgressRow(name: 'Final Exam', value: 0.0, trailing: 'JUNE 15'),
                    const SizedBox(height: 8),
                    PrimaryButton(text: 'View Detailed Feedback', onPressed: () {}, height: 44, radius: 14),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Text('Your Certificates', style: AppTextTheme.headingMD.copyWith(fontSize: 18)),
                  const Spacer(),
                  TextButton(onPressed: () {}, child: const Text('View All')),
                ],
              ),
              _CertificateTile(
                title: 'UI Design Specialist',
                date: 'Issued Jan 11, 2026',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CertificateScreen())),
              ),
              const SizedBox(height: 8),
              _CertificateTile(
                title: 'Data Science Pro',
                date: 'Issued Feb 22, 2026',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CertificateScreen())),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.value, required this.label, required this.caption});
  final String value;
  final String label;
  final String caption;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(caption, style: AppTextTheme.bodySmall.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 6),
          Text(value, style: AppTextTheme.headingLG.copyWith(fontSize: 30)),
          Text(label, style: AppTextTheme.bodySmall.copyWith(color: AppColors.primary)),
        ],
      ),
    );
  }
}

class _Panel extends StatelessWidget {
  const _Panel({required this.title, required this.child});
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w700)),
          child,
        ],
      ),
    );
  }
}

class _ProgressRow extends StatelessWidget {
  const _ProgressRow({required this.name, required this.value, this.trailing});
  final String name;
  final double value;
  final String? trailing;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Row(
            children: [
              Text(name, style: AppTextTheme.bodySmall),
              const Spacer(),
              Text(trailing ?? '${(value * 100).toStringAsFixed(0)}%', style: AppTextTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: value,
            backgroundColor: AppColors.grey200,
            color: AppColors.primary,
            minHeight: 6,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }
}

class _CertificateTile extends StatelessWidget {
  const _CertificateTile({required this.title, required this.date, required this.onTap});
  final String title;
  final String date;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.grey200),
        ),
        child: Row(
          children: [
            const CircleAvatar(radius: 18, backgroundColor: AppColors.primaryLight, child: Icon(Icons.workspace_premium)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w700)),
                  Text(date, style: AppTextTheme.bodySmall.copyWith(color: AppColors.textSecondary)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, size: 16),
          ],
        ),
      ),
    );
  }
}

class _SimpleLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    final path = Path()
      ..moveTo(0, size.height * .75)
      ..quadraticBezierTo(size.width * .2, size.height * .55, size.width * .35, size.height * .58)
      ..quadraticBezierTo(size.width * .5, size.height * .9, size.width * .65, size.height * .52)
      ..quadraticBezierTo(size.width * .82, size.height * .15, size.width, size.height * .22);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
