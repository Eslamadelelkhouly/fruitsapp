import 'package:dartz/dartz.dart';
import 'package:fruitsapp/core/errors/failures.dart';
import 'package:fruitsapp/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> createUserWithEmailandPassword(
    String email,
    String password,
    String name,
  );

  Future<Either<Failures, UserEntity>> signInEmailandPassword({
    required String email,
    required String password,
  });
  Future<Either<Failures, UserEntity>> signInWithGoogle();
  Future<Either<Failures, UserEntity>> signInWithFacebook();
  Future addUser({required UserEntity user});
}
