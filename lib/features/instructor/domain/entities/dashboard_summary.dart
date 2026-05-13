import 'package:equatable/equatable.dart';

class DashboardSummary extends Equatable {
  final String instructorName;
  final String monthlyRevenueDisplay;
  final String revenueDeltaLabel;
  final int activeStudents;
  final String studentsSubtitle;
  final int liveCourses;
  final String coursesSubtitle;
  final List<DashboardActivityItem> activities;
  final List<DashboardAlertItem> alerts;

  const DashboardSummary({
    required this.instructorName,
    required this.monthlyRevenueDisplay,
    required this.revenueDeltaLabel,
    required this.activeStudents,
    required this.studentsSubtitle,
    required this.liveCourses,
    required this.coursesSubtitle,
    required this.activities,
    required this.alerts,
  });

  @override
  List<Object?> get props => [
        instructorName,
        monthlyRevenueDisplay,
        revenueDeltaLabel,
        activeStudents,
        studentsSubtitle,
        liveCourses,
        coursesSubtitle,
        activities,
        alerts,
      ];
}

enum DashboardActivityKind { enrollment, submission, completion }

class DashboardActivityItem extends Equatable {
  final DashboardActivityKind kind;
  final String title;
  final String subtitle;
  final String timeLabel;

  const DashboardActivityItem({
    required this.kind,
    required this.title,
    required this.subtitle,
    required this.timeLabel,
  });

  @override
  List<Object?> get props => [kind, title, subtitle, timeLabel];
}

class DashboardAlertItem extends Equatable {
  final String title;
  final String body;

  const DashboardAlertItem({required this.title, required this.body});

  @override
  List<Object?> get props => [title, body];
}
