import 'package:lms_mobileapp/features/instructor/data/repositories/instructor_dashboard_repository.dart';
import 'package:lms_mobileapp/features/instructor/domain/entities/dashboard_summary.dart';

class MockInstructorDashboardRepository implements InstructorDashboardRepository {
  @override
  Future<DashboardSummary> fetchSummary() async {
    await Future<void>.delayed(const Duration(milliseconds: 120));
    return const DashboardSummary(
      instructorName: 'Julian',
      monthlyRevenueDisplay: r'$14,280',
      revenueDeltaLabel: '+12% from last month',
      activeStudents: 1842,
      studentsSubtitle: '84 new this week',
      liveCourses: 12,
      coursesSubtitle: '2 in draft mode',
      activities: [
        DashboardActivityItem(
          kind: DashboardActivityKind.enrollment,
          title: 'New Enrollment: UI/UX Principles',
          subtitle: 'Elena Vance joined the workshop',
          timeLabel: '2 MINS AGO',
        ),
        DashboardActivityItem(
          kind: DashboardActivityKind.submission,
          title: 'Submission: Midterm Portfolio',
          subtitle: "Mark Sloan submitted 'Branding Case Study'",
          timeLabel: '43 MINS AGO',
        ),
        DashboardActivityItem(
          kind: DashboardActivityKind.completion,
          title: 'Course Completed',
          subtitle: "12 students finished 'Typography Masterclass'",
          timeLabel: '3 HOURS AGO',
        ),
      ],
      alerts: [
        DashboardAlertItem(
          title: 'System Update',
          body:
              'Check your original fonts link in Module 2 — we detected a broken asset.',
        ),
        DashboardAlertItem(
          title: 'Payout Processing',
          body: 'Your last payout has been sent to your linked account.',
        ),
        DashboardAlertItem(
          title: 'Student Query',
          body: 'Sarah Miller asked a question in Module 4.',
        ),
      ],
    );
  }
}
