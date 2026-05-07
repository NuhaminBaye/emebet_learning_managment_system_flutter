import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lms_mobileapp/features/auth/presentation/bloc/auth_event.dart';
import 'package:lms_mobileapp/features/auth/presentation/bloc/auth_state.dart';
import 'package:lms_mobileapp/features/auth/presentation/screens/login_screen.dart';
import 'package:lms_mobileapp/features/trainee/presentation/screens/main/student_shell_screen.dart';
// import 'package:lms_mobileapp/features/instructor/presentation/screens/instructor_shell_screen.dart'; // Create this
// import 'package:lms_mobileapp/features/admin/presentation/screens/admin_shell_screen.dart';       // Create this

class RoleBasedRouter extends StatelessWidget {
  const RoleBasedRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        // Loading States
        if (state is AuthLoading || state is AuthInitial) {
          return const Scaffold(
            backgroundColor: AppColors.background,
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Unauthenticated
        if (state is AuthUnauthenticated || state is AuthError) {
          return const LoginScreen();
        }

        // Authenticated → Role-based routing
        if (state is AuthAuthenticated) {
          final user = state.user;
          final roleKey = user.currentRole?.key?.toLowerCase().trim();

          switch (roleKey) {
            case 'student':
            case 'trainee':
              return const StudentShellScreen();

            case 'instructor':
            case 'teacher':
              // return const InstructorShellScreen();

            case 'admin':
            case 'administrator':
              // return const AdminShellScreen();

            default:
              return const _UnknownRoleScreen();
          }
        }

        // Fallback
        return const LoginScreen();
      },
    );
  }
}

/// Fallback screen when role is unknown or not supported
class _UnknownRoleScreen extends StatelessWidget {
  const _UnknownRoleScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.account_balance_wallet_outlined,
                size: 64,
                color: AppColors.textSecondary,
              ),
              const SizedBox(height: 24),
              Text(
                'Role Not Supported',
                style: AppTextTheme.headingMD,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Your account role is not recognized.\nPlease contact support.',
                style: AppTextTheme.bodyRegular.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  context.read<AuthBloc>().add(LogoutRequested());
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(160, 48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
