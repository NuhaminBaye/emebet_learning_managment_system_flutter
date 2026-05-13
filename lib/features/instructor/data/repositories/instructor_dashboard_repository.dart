import 'package:lms_mobileapp/features/instructor/domain/entities/dashboard_summary.dart';

/// Backend-ready contract for instructor dashboard data.
abstract class InstructorDashboardRepository {
  Future<DashboardSummary> fetchSummary();
}
