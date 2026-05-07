import 'package:equatable/equatable.dart';

class ProfileUser extends Equatable {
  final String fullName;
  final String email;
  final String bio;
  final String avatarUrl;
  final int coursesEnrolled;
  final int certificates;
  final double gpa;

  const ProfileUser({
    required this.fullName,
    required this.email,
    required this.bio,
    required this.avatarUrl,
    required this.coursesEnrolled,
    required this.certificates,
    required this.gpa,
  });

  @override
  List<Object?> get props => [fullName, email, bio, avatarUrl, coursesEnrolled, certificates, gpa];
}

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileUser user;
  const ProfileLoaded(this.user);
}

class ProfileError extends ProfileState {
  final String message;
  const ProfileError(this.message);
}