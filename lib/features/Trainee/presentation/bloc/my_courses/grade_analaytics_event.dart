import 'package:equatable/equatable.dart';

abstract class GradeAnalyticsEvent extends Equatable {
  const GradeAnalyticsEvent();
  @override
  List<Object?> get props => [];
}

class LoadGradeAnalytics extends GradeAnalyticsEvent {}