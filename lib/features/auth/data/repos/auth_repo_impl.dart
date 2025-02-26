import 'package:dartz/dartz.dart';
import 'package:fruitsapp/core/errors/failures.dart';
import 'package:fruitsapp/features/auth/domain/entities/user_entity.dart';
import 'package:fruitsapp/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailandPassword(
      String email, String password) {
    // TODO: implement createUserWithEmailandPassword
    throw UnimplementedError();
  }
}
