import 'package:dartz/dartz.dart';
import 'package:fruitsapp/core/errors/failures.dart';
import 'package:fruitsapp/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> createUserWithEmailandPassword(
    String email,
    String password,
    String name,
  );
}
