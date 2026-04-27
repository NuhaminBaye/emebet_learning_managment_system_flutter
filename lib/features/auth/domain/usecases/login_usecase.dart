import 'package:dartz/dartz.dart';
import 'package:lms_mobileapp/core/network/error/failures.dart';
import 'package:lms_mobileapp/features/auth/domain/entities/user_entity.dart';
import 'package:lms_mobileapp/features/auth/domain/repositories/auth_repository.dart';

class LoginParams {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});
}

class LoginUseCase {
  final AuthRepository repository;

  const LoginUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(LoginParams params) {
    return repository.login(params.email, params.password);
  }
}
