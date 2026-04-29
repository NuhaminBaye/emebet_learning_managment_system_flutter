import 'package:lms_mobileapp/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:lms_mobileapp/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:lms_mobileapp/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:lms_mobileapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:lms_mobileapp/features/auth/domain/usecases/logout_usecase.dart';
import 'package:lms_mobileapp/features/auth/domain/usecases/register_usecase.dart';
import 'package:lms_mobileapp/features/auth/presentation/bloc/auth_bloc.dart';

class AuthModule {
  static AuthBloc createBloc() {
    final repository = AuthRepositoryImpl();

    return AuthBloc(
      loginUseCase: LoginUseCase(repository),
      registerUseCase: RegisterUseCase(repository),
      logoutUseCase: LogoutUseCase(repository),
      getCurrentUserUseCase: GetCurrentUserUseCase(repository),
      forgotPasswordUseCase: ForgotPasswordUseCase(repository),
    );
  }
}
