import 'package:dartz/dartz.dart';
import 'package:fruitsapp/core/errors/custom_exception.dart';
import 'package:fruitsapp/core/errors/failures.dart';
import 'package:fruitsapp/core/services/firebase_auth_services.dart';
import 'package:fruitsapp/features/auth/data/models/user_model.dart';
import 'package:fruitsapp/features/auth/domain/entities/user_entity.dart';
import 'package:fruitsapp/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoImpl({required this.firebaseAuthServices});
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailandPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthServices.createEmailandPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.toString()));
    } catch (e) {
      return left(ServerFailure(message: 'An error occured , try again later'));
    }
  }
}
