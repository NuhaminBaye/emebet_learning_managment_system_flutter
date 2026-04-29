import 'package:dartz/dartz.dart';
import 'package:lms_mobileapp/core/network/error/failures.dart';
import 'package:lms_mobileapp/core/usecases/usecase.dart';
import 'package:lms_mobileapp/features/auth/domain/models/user_model.dart';
import 'package:lms_mobileapp/features/auth/domain/repositories/abstract_auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository repository;

  const GetCurrentUserUseCase(this.repository);

  Future<Either<Failure, UserModel>> call(NoParams params) {
    return repository.getCurrentUser();
  }
}
