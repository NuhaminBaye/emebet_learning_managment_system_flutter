import 'package:flutter/foundation.dart';
import 'package:lms_mobileapp/core/usecases/usecase.dart';
import 'package:lms_mobileapp/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:lms_mobileapp/features/auth/domain/entities/user_entity.dart';
import 'package:lms_mobileapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:lms_mobileapp/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:lms_mobileapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:lms_mobileapp/features/auth/domain/usecases/logout_usecase.dart';
import 'package:lms_mobileapp/features/auth/domain/usecases/register_usecase.dart';

enum AuthStatus { idle, loading, success, authenticated, unauthenticated, error }

class AuthProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final AuthRepository _authRepository;

  AuthStatus status = AuthStatus.idle;
  String? message;
  UserEntity? user;

  AuthProvider({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
    required this.getCurrentUserUseCase,
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  factory AuthProvider.createDefault() {
    final repository = AuthRepositoryImpl();
    return AuthProvider(
      loginUseCase: LoginUseCase(repository),
      registerUseCase: RegisterUseCase(repository),
      logoutUseCase: LogoutUseCase(repository),
      getCurrentUserUseCase: GetCurrentUserUseCase(repository),
      authRepository: repository,
    );
  }

  bool get isLoading => status == AuthStatus.loading;
  bool get isAuthenticated => user != null;

  Future<bool> login({required String email, required String password}) async {
    status = AuthStatus.loading;
    message = null;
    notifyListeners();

    final result = await loginUseCase(LoginParams(email: email, password: password));
    return result.fold((failure) {
      status = AuthStatus.error;
      message = failure.errorMessage;
      notifyListeners();
      return false;
    }, (authenticatedUser) {
      user = authenticatedUser;
      status = AuthStatus.authenticated;
      notifyListeners();
      return true;
    });
  }

  Future<bool> register({required String name, required String email, required String password}) async {
    status = AuthStatus.loading;
    message = null;
    notifyListeners();

    final result = await registerUseCase(RegisterParams(name: name, email: email, password: password));
    return result.fold((failure) {
      status = AuthStatus.error;
      message = failure.errorMessage;
      notifyListeners();
      return false;
    }, (authenticatedUser) {
      user = authenticatedUser;
      status = AuthStatus.authenticated;
      notifyListeners();
      return true;
    });
  }

  Future<bool> logout() async {
    status = AuthStatus.loading;
    message = null;
    notifyListeners();

    final result = await logoutUseCase(NoParams());
    return result.fold((failure) {
      status = AuthStatus.error;
      message = failure.errorMessage;
      notifyListeners();
      return false;
    }, (_) {
      user = null;
      status = AuthStatus.unauthenticated;
      notifyListeners();
      return true;
    });
  }

  Future<bool> loadCurrentUser() async {
    status = AuthStatus.loading;
    message = null;
    notifyListeners();

    final result = await getCurrentUserUseCase(NoParams());
    return result.fold((failure) {
      status = AuthStatus.error;
      message = failure.errorMessage;
      notifyListeners();
      return false;
    }, (fetchedUser) {
      user = fetchedUser;
      status = AuthStatus.authenticated;
      notifyListeners();
      return true;
    });
  }

  Future<bool> forgotPassword({required String email}) async {
    status = AuthStatus.loading;
    message = null;
    notifyListeners();

    final result = await _authRepository.forgotPassword(email);
    return result.fold((failure) {
      status = AuthStatus.error;
      message = failure.errorMessage;
      notifyListeners();
      return false;
    }, (_) {
      status = AuthStatus.success;
      message = 'A password reset link has been sent to your email.';
      notifyListeners();
      return true;
    });
  }

  void clearMessage() {
    message = null;
    notifyListeners();
  }
}
