import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/features/instructor/data/repositories/instructor_dashboard_repository.dart';
import 'package:lms_mobileapp/features/instructor/presentation/bloc/dashboard/instructor_dashboard_event.dart';
import 'package:lms_mobileapp/features/instructor/presentation/bloc/dashboard/instructor_dashboard_state.dart';

class InstructorDashboardBloc
    extends Bloc<InstructorDashboardEvent, InstructorDashboardState> {
  InstructorDashboardBloc({required InstructorDashboardRepository repository})
      : _repository = repository,
        super(const InstructorDashboardState()) {
    on<InstructorDashboardRequested>(_onRequested);
  }

  final InstructorDashboardRepository _repository;

  Future<void> _onRequested(
    InstructorDashboardRequested event,
    Emitter<InstructorDashboardState> emit,
  ) async {
    emit(state.copyWith(status: InstructorDashboardStatus.loading));
    try {
      final summary = await _repository.fetchSummary();
      emit(
        state.copyWith(
          status: InstructorDashboardStatus.success,
          summary: summary,
          message: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: InstructorDashboardStatus.failure,
          message: e.toString(),
        ),
      );
    }
  }
}
