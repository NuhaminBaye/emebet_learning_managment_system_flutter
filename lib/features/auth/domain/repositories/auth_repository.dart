import 'package:lms_mobileapp/core/constants/constants.dart';
import 'package:lms_mobileapp/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  ResultFuture<UserEntity> login(String email, String password);
  ResultFuture<UserEntity> register(String name, String email, String password);
  ResultFuture<void> logout();
  ResultFuture<UserEntity> getCurrentUser();
  ResultFuture<void> forgotPassword(String email);
}
