import 'package:dartz/dartz.dart';
import 'package:lms_mobileapp/core/network/error/failures.dart';
import 'package:lms_mobileapp/features/auth/domain/models/user_model.dart';
import 'package:lms_mobileapp/features/auth/domain/repositories/abstract_auth_repository.dart';

class RegisterParams {
  final String name;
  final String email;
  final String password;

  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
  });
}

class RegisterUseCase {
  final AuthRepository repository;

  const RegisterUseCase(this.repository);

  Future<Either<Failure, UserModel>> call(RegisterParams params) {
    return repository.register(params.name, params.email, params.password);
  }
}
