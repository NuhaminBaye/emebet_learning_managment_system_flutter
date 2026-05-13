import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/features/Trainee/data/repositories/wishlist_repository.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/wishlist/wishlist_event.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/wishlist/wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc({required WishlistRepository repository})
      : _repository = repository,
        super(const WishlistState()) {
    on<WishlistStarted>(_onStarted);
    on<WishlistToggled>(_onToggled);
    on<WishlistCleared>(_onCleared);
  }

  final WishlistRepository _repository;

  Future<void> _onStarted(
    WishlistStarted event,
    Emitter<WishlistState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final courses = await _repository.getWishlistCourses();
    emit(state.copyWith(courses: courses, isLoading: false));
  }

  Future<void> _onToggled(
    WishlistToggled event,
    Emitter<WishlistState> emit,
  ) async {
    await _repository.toggle(event.course);
    final courses = await _repository.getWishlistCourses();
    emit(state.copyWith(courses: courses));
  }

  Future<void> _onCleared(
    WishlistCleared event,
    Emitter<WishlistState> emit,
  ) async {
    await _repository.clear();
    emit(state.copyWith(courses: const []));
  }
}
