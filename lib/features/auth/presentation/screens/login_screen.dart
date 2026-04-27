import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:lms_mobileapp/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:lms_mobileapp/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:lms_mobileapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:lms_mobileapp/features/auth/domain/usecases/logout_usecase.dart';
import 'package:lms_mobileapp/features/auth/domain/usecases/register_usecase.dart';
import 'package:lms_mobileapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lms_mobileapp/features/auth/presentation/bloc/auth_event.dart';
import 'package:lms_mobileapp/features/auth/presentation/bloc/auth_state.dart';
import 'package:lms_mobileapp/shared/widgets/auth_widgets/auth_form.dart';
import 'package:lms_mobileapp/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:lms_mobileapp/features/auth/presentation/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        loginUseCase: LoginUseCase(AuthRepositoryImpl()),
        registerUseCase: RegisterUseCase(AuthRepositoryImpl()),
        logoutUseCase: LogoutUseCase(AuthRepositoryImpl()),
        getCurrentUserUseCase: GetCurrentUserUseCase(AuthRepositoryImpl()),
        forgotPasswordUseCase: ForgotPasswordUseCase(AuthRepositoryImpl()),
      )..add(GetCurrentUserRequested()),
      child: const _LoginScreenContent(),
    );
  }
}

class _LoginScreenContent extends StatelessWidget {
  const _LoginScreenContent();

  void _handleLogin(BuildContext context, String _, String email, String password) {
    context.read<AuthBloc>().add(LoginRequested(email: email, password: password));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Signed in successfully')),
          );
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Lumina Academy'),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: AppColors.textPrimary,
          ),
          body: SafeArea(
            child: Padding(
              padding: AppSpacing.sectionPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back',
                    style: AppTextTheme.headingLG,
                  ),
                  AppSpacing.verticalXs,
                  Text(
                    'Please enter your details to access your account.',
                    style: AppTextTheme.bodyRegular.copyWith(color: AppColors.textSecondary),
                  ),
                  AppSpacing.verticalXl,
                  AuthForm(
                    mode: AuthFormMode.login,
                    loading: isLoading,
                    onSubmit: (name, email, password) => _handleLogin(context, name, email, password),
                  ),
                  AppSpacing.verticalMd,
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const ForgotPasswordScreen(),
                                ),
                              );
                            },
                      child: Text(
                        'Forgot Password?',
                        style: AppTextTheme.bodyMedium.copyWith(color: AppColors.link),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: AppTextTheme.bodyMedium.copyWith(color: AppColors.textSecondary),
                      ),
                      TextButton(
                        onPressed: isLoading
                            ? null
                            : () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const RegisterScreen(),
                                  ),
                                );
                              },
                        child: Text(
                          'Sign Up',
                          style: AppTextTheme.bodyMedium.copyWith(color: AppColors.link),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
