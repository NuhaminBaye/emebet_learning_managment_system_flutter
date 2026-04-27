import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/utils/validtaion_utils.dart';
import 'package:lms_mobileapp/shared/widgets/inputs/app_text_field.dart';

enum AuthFormMode { login, register }

class AuthForm extends StatefulWidget {
  final AuthFormMode mode;
  final bool loading;
  final void Function(String name, String email, String password) onSubmit;

  const AuthForm({
    super.key,
    required this.mode,
    required this.onSubmit,
    this.loading = false,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    widget.onSubmit(
      _nameController.text.trim(),
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.mode == AuthFormMode.register) ...[
            AppTextField(
              hint: 'Full name',
              controller: _nameController,
              validator: ValidationUtils.required,
            ),
            AppSpacing.verticalMd,
          ],
          AppTextField(
            hint: 'Email address',
            controller: _emailController,
            validator: ValidationUtils.email,
          ),
          AppSpacing.verticalMd,
          AppTextField(
            hint: 'Password',
            controller: _passwordController,
            obscure: true,
            validator: ValidationUtils.password,
          ),
          AppSpacing.verticalLg,
          ElevatedButton(
            onPressed: widget.loading ? null : _submit,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.textOnPrimary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: widget.loading
                ? const CircularProgressIndicator(color: AppColors.textOnPrimary)
                : Text(widget.mode == AuthFormMode.login ? 'Sign In' : 'Create Account'),
          ),
        ],
      ),
    );
  }
}
