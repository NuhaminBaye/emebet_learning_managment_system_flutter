import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';
import 'package:lms_mobileapp/features/instructor/data/repositories/mock_instructor_dashboard_repository.dart';
import 'package:lms_mobileapp/features/instructor/domain/entities/dashboard_summary.dart';
import 'package:lms_mobileapp/features/instructor/presentation/bloc/dashboard/instructor_dashboard_bloc.dart';
import 'package:lms_mobileapp/features/instructor/presentation/bloc/dashboard/instructor_dashboard_event.dart';
import 'package:lms_mobileapp/features/instructor/presentation/bloc/dashboard/instructor_dashboard_state.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/instructor_chrome_app_bar.dart';

class InstructorDashboardScreen extends StatelessWidget {
  const InstructorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InstructorDashboardBloc(
        repository: MockInstructorDashboardRepository(),
      )..add(const InstructorDashboardRequested()),
      child: const _InstructorDashboardView(),
    );
  }
}

class _InstructorDashboardView extends StatelessWidget {
  const _InstructorDashboardView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InstructorDesign.canvas,
      appBar: const InstructorChromeAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.createCourse);
        },
        backgroundColor: InstructorDesign.primary,
        elevation: 0,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: BlocBuilder<InstructorDashboardBloc, InstructorDashboardState>(
        builder: (context, state) {
          if (state.status == InstructorDashboardStatus.loading ||
              state.status == InstructorDashboardStatus.initial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == InstructorDashboardStatus.failure) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  state.message ?? 'Unable to load dashboard',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          final s = state.summary!;
          return RefreshIndicator(
            color: InstructorDesign.primary,
            onRefresh: () async {
              context.read<InstructorDashboardBloc>().add(
                    const InstructorDashboardRequested(),
                  );
              await Future<void>.delayed(const Duration(milliseconds: 200));
            },
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
              children: [
                const Text(
                  'INSTRUCTOR OVERVIEW',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.1,
                    color: InstructorDesign.primary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Bonjour, ${s.instructorName}.',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: InstructorDesign.textPrimary,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 20),
                _RevenueCard(
                  amount: s.monthlyRevenueDisplay,
                  delta: s.revenueDeltaLabel,
                  onAnalytics: () {},
                ),
                const SizedBox(height: 14),
                _PastelMetricCard(
                  icon: Icons.people_alt_outlined,
                  label: 'ACTIVE STUDENTS',
                  value: _formatInt(s.activeStudents),
                  subtitle: s.studentsSubtitle,
                ),
                const SizedBox(height: 14),
                _PastelMetricCard(
                  icon: Icons.menu_book_outlined,
                  label: 'LIVE COURSES',
                  value: '${s.liveCourses}',
                  subtitle: s.coursesSubtitle,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Text(
                      'Recent Activity',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: InstructorDesign.textPrimary,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View All Journal',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: InstructorDesign.primary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ...s.activities.map(_ActivityTile.new),
                const SizedBox(height: 20),
                _AlertsCenter(alerts: s.alerts),
              ],
            ),
          );
        },
      ),
    );
  }

  static String _formatInt(int value) {
    final s = value.toString();
    final buf = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write(',');
      buf.write(s[i]);
    }
    return buf.toString();
  }
}

class _RevenueCard extends StatelessWidget {
  const _RevenueCard({
    required this.amount,
    required this.delta,
    required this.onAnalytics,
  });

  final String amount;
  final String delta;
  final VoidCallback onAnalytics;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: InstructorDesign.revenueCard,
        borderRadius: BorderRadius.circular(InstructorDesign.radiusCard),
        boxShadow: InstructorDesign.cardShadow(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.account_balance_wallet_outlined,
                    color: Colors.white),
              ),
              const Spacer(),
              const Text(
                'MONTHLY REVENUE',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.05,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            amount,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w800,
              height: 1.05,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            delta,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 14),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: onAnalytics,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'VIEW ANALYTICS',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PastelMetricCard extends StatelessWidget {
  const _PastelMetricCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.subtitle,
  });

  final IconData icon;
  final String label;
  final String value;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: InstructorDesign.surfaceMuted,
        borderRadius: BorderRadius.circular(InstructorDesign.radiusCard),
        boxShadow: InstructorDesign.cardShadow(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: InstructorDesign.primary, size: 26),
              const Spacer(),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.05,
                  color: InstructorDesign.textTertiary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: InstructorDesign.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: InstructorDesign.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityTile extends StatelessWidget {
  const _ActivityTile(this.item);

  final DashboardActivityItem item;

  @override
  Widget build(BuildContext context) {
    final thumb = switch (item.kind) {
      DashboardActivityKind.enrollment =>
        'https://picsum.photos/seed/enroll/200/200',
      DashboardActivityKind.submission => '',
      DashboardActivityKind.completion => '',
    };

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: InstructorDesign.surface,
          borderRadius: BorderRadius.circular(18),
          boxShadow: InstructorDesign.cardShadow(context),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ActivityLeading(kind: item.kind, imageUrl: thumb),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: InstructorDesign.textPrimary,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: InstructorDesign.textSecondary,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              item.timeLabel,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: InstructorDesign.textTertiary,
                letterSpacing: 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityLeading extends StatelessWidget {
  const _ActivityLeading({required this.kind, required this.imageUrl});

  final DashboardActivityKind kind;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    const size = 52.0;
    switch (kind) {
      case DashboardActivityKind.enrollment:
        return ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: SizedBox(
            width: size,
            height: size,
            child: imageUrl.isEmpty
                ? Container(color: InstructorDesign.surfaceMuted)
                : CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) =>
                        Container(color: InstructorDesign.surfaceMuted),
                  ),
          ),
        );
      case DashboardActivityKind.submission:
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: InstructorDesign.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.check_rounded, color: InstructorDesign.primary),
        );
      case DashboardActivityKind.completion:
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: const Color(0xFFDCEBFF),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.auto_stories_outlined,
              color: Color(0xFF2F80ED)),
        );
    }
  }
}

class _AlertsCenter extends StatelessWidget {
  const _AlertsCenter({required this.alerts});

  final List<DashboardAlertItem> alerts;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: InstructorDesign.surfaceMuted,
        borderRadius: BorderRadius.circular(InstructorDesign.radiusCard),
        boxShadow: InstructorDesign.cardShadow(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Alerts Center',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: InstructorDesign.textPrimary,
            ),
          ),
          const SizedBox(height: 14),
          ...alerts.asMap().entries.map((e) {
            final i = e.key;
            final a = e.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 4,
                    height: 46,
                    decoration: BoxDecoration(
                      color: i == 0
                          ? InstructorDesign.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          a.title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: InstructorDesign.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          a.body,
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.35,
                            color: InstructorDesign.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 4),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: InstructorDesign.surface.withValues(alpha: 0.65),
                foregroundColor: InstructorDesign.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Clear All Notifications',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
