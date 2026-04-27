import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:lms_mobileapp/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:lms_mobileapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:lms_mobileapp/features/auth/domain/usecases/logout_usecase.dart';
import 'package:lms_mobileapp/features/auth/domain/usecases/register_usecase.dart';
import 'package:lms_mobileapp/features/auth/presentation/bloc/auth_event.dart';
import 'package:lms_mobileapp/features/auth/presentation/bloc/auth_state.dart';
import 'package:lms_mobileapp/core/usecases/usecase.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
    required this.getCurrentUserUseCase,
    required this.forgotPasswordUseCase,
  }) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<GetCurrentUserRequested>(_onGetCurrentUserRequested);
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await loginUseCase(LoginParams(
      email: event.email,
      password: event.password,
    ));
    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await registerUseCase(RegisterParams(
      name: event.name,
      email: event.email,
      password: event.password,
    ));
    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await logoutUseCase(NoParams());
    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (_) => emit(AuthUnauthenticated()),
    );
  }

  Future<void> _onGetCurrentUserRequested(
    GetCurrentUserRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await getCurrentUserUseCase(NoParams());
    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> _onForgotPasswordRequested(
    ForgotPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await forgotPasswordUseCase(ForgotPasswordParams(email: event.email));
    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (_) => emit(AuthSuccess('Password reset link sent to your email')),
    );
  }
}
