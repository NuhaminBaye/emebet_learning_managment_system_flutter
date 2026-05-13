import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
  }

  Future<void> _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(milliseconds: 800));

      final user = ProfileUser(
        fullName: "Elena Rodriguez",
        email: "elena.rodriguez@lumina.edu",
        bio: "Aspiring digital architect with a passion for sustainable design and interactive learning environments.",
        avatarUrl: "https://ui-avatars.com/api/?name=Elena+Rodriguez&background=23C55E&color=ffffff&size=256",
        coursesEnrolled: 12,
        certificates: 8,
        gpa: 3.8,
      );

      emit(ProfileLoaded(user));
    } catch (e) {
      emit(const ProfileError("Failed to load profile data"));
    }
  }
}