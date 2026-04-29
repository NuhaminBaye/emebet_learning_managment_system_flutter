import 'package:dartz/dartz.dart';
import 'package:lms_mobileapp/core/network/error/failures.dart';
import 'package:lms_mobileapp/core/usecases/usecase.dart';
import 'package:lms_mobileapp/features/auth/domain/repositories/abstract_auth_repository.dart';

class LogoutUseCase {
  final AuthRepository repository;

  const LogoutUseCase(this.repository);

  Future<Either<Failure, void>> call(NoParams params) {
    return repository.logout();
  }
}
