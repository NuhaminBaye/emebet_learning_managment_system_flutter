import 'package:equatable/equatable.dart';
import 'package:lms_mobileapp/features/instructor/domain/entities/dashboard_summary.dart';

enum InstructorDashboardStatus { initial, loading, success, failure }

class InstructorDashboardState extends Equatable {
  final InstructorDashboardStatus status;
  final DashboardSummary? summary;
  final String? message;

  const InstructorDashboardState({
    this.status = InstructorDashboardStatus.initial,
    this.summary,
    this.message,
  });

  InstructorDashboardState copyWith({
    InstructorDashboardStatus? status,
    DashboardSummary? summary,
    String? message,
  }) {
    return InstructorDashboardState(
      status: status ?? this.status,
      summary: summary ?? this.summary,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, summary, message];
}
