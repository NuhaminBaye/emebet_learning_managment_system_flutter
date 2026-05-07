import 'package:equatable/equatable.dart';

class GradeAnalyticsData extends Equatable {
  final double gpa;
  final int creditsCompleted;
  final double overallProgress;
  final Map<String, double> componentBreakdown;

  const GradeAnalyticsData({
    required this.gpa,
    required this.creditsCompleted,
    required this.overallProgress,
    required this.componentBreakdown,
  });

  @override
  List<Object?> get props => [gpa, creditsCompleted, overallProgress, componentBreakdown];
}

abstract class GradeAnalyticsState extends Equatable {
  const GradeAnalyticsState();
  @override
  List<Object?> get props => [];
}

class GradeAnalyticsInitial extends GradeAnalyticsState {}
class GradeAnalyticsLoading extends GradeAnalyticsState {}
class GradeAnalyticsLoaded extends GradeAnalyticsState {
  final GradeAnalyticsData data;
  const GradeAnalyticsLoaded(this.data);
}
class GradeAnalyticsError extends GradeAnalyticsState {
  final String message;
  const GradeAnalyticsError(this.message);
}