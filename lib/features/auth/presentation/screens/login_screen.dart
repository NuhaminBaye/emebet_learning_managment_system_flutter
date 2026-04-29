import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/auth/presentation/auth_module.dart';
import 'package:lms_mobileapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lms_mobileapp/features/auth/presentation/bloc/auth_event.dart';
import 'package:lms_mobileapp/features/auth/presentation/bloc/auth_state.dart';
import 'package:lms_mobileapp/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:lms_mobileapp/features/auth/presentation/screens/register_screen.dart';
import 'package:lms_mobileapp/shared/widgets/auth_widgets/auth_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthModule.createBloc()..add(GetCurrentUserRequested()),
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
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Lumina Academy',
                      style: AppTextTheme.headingLG.copyWith(color: AppColors.primary),
                    ),
                  ),
                  AppSpacing.verticalXl,
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 24,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
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
                        AppSpacing.verticalSm,
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
                              'Forgot password?',
                              style: AppTextTheme.bodyMedium.copyWith(color: AppColors.primary),
                            ),
                          ),
                        ),
                        AppSpacing.verticalLg,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: isLoading ? null : () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.surface,
                                  foregroundColor: AppColors.textPrimary,
                                  elevation: 0,
                                  side: BorderSide(color: AppColors.grey200),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  minimumSize: const Size.fromHeight(48),
                                ),
                                child: const Text('Google'),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: isLoading ? null : () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.surface,
                                  foregroundColor: AppColors.textPrimary,
                                  elevation: 0,
                                  side: BorderSide(color: AppColors.grey200),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  minimumSize: const Size.fromHeight(48),
                                ),
                                child: const Text('Apple'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.verticalMd,
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
                          style: AppTextTheme.bodyMedium.copyWith(color: AppColors.primary),
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
