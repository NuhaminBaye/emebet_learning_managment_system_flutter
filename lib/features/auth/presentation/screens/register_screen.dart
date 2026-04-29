import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/auth/presentation/auth_module.dart';
import 'package:lms_mobileapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lms_mobileapp/features/auth/presentation/bloc/auth_event.dart';
import 'package:lms_mobileapp/features/auth/presentation/bloc/auth_state.dart';
import 'package:lms_mobileapp/features/auth/presentation/screens/login_screen.dart';
import 'package:lms_mobileapp/shared/widgets/auth_widgets/auth_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthModule.createBloc(),
      child: const _RegisterScreenContent(),
    );
  }
}

class _RegisterScreenContent extends StatefulWidget {
  const _RegisterScreenContent();

  @override
  State<_RegisterScreenContent> createState() => _RegisterScreenContentState();
}

class _RegisterScreenContentState extends State<_RegisterScreenContent> {
  bool _isInstructor = false;

  void _handleRegister(BuildContext context, String name, String email, String password) {
    context.read<AuthBloc>().add(RegisterRequested(name: name, email: email, password: password));
  }

  void _toggleRole(bool instructor) {
    setState(() {
      _isInstructor = instructor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Account created successfully')),
          );
          Navigator.of(context).pop();
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                  ),
                  AppSpacing.verticalMd,
                  Text(
                    "Emebet's Academy",
                    style: AppTextTheme.bodyMedium.copyWith(color: AppColors.textSecondary),
                  ),
                  AppSpacing.verticalSm,
                  Text(
                    'Create Account',
                    style: AppTextTheme.headingLG,
                  ),
                  AppSpacing.verticalXs,
                  Text(
                    'Start your journey at Lumina Academy',
                    style: AppTextTheme.bodyRegular.copyWith(color: AppColors.textSecondary),
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
                          blurRadius: 22,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => _toggleRole(false),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: _isInstructor ? AppColors.grey100 : AppColors.primaryLight,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: _isInstructor ? AppColors.grey200 : AppColors.primary,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Trainee',
                                      style: AppTextTheme.bodyMedium.copyWith(
                                        color: _isInstructor ? AppColors.textPrimary : AppColors.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => _toggleRole(true),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: _isInstructor ? AppColors.primaryLight : AppColors.grey100,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: _isInstructor ? AppColors.primary : AppColors.grey200,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Instructor',
                                      style: AppTextTheme.bodyMedium.copyWith(
                                        color: _isInstructor ? AppColors.primary : AppColors.textPrimary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        AppSpacing.verticalLg,
                        AuthForm(
                          mode: AuthFormMode.register,
                          loading: isLoading,
                          onSubmit: (name, email, password) => _handleRegister(context, name, email, password),
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.verticalMd,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: AppTextTheme.bodyMedium.copyWith(color: AppColors.textSecondary),
                      ),
                      TextButton(
                        onPressed: isLoading
                            ? null
                            : () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                                );
                              },
                        child: Text(
                          'Sign In',
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
