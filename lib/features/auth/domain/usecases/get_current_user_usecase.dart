import 'package:dartz/dartz.dart';
import 'package:lms_mobileapp/core/network/error/failures.dart';
import 'package:lms_mobileapp/core/usecases/usecase.dart';
import 'package:lms_mobileapp/features/auth/domain/entities/user_entity.dart';
import 'package:lms_mobileapp/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository repository;

  const GetCurrentUserUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(NoParams params) {
    return repository.getCurrentUser();
  }
}
