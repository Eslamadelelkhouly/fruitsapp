import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruitsapp/core/errors/custom_exception.dart';
import 'package:fruitsapp/core/errors/failures.dart';
import 'package:fruitsapp/core/services/backend_endpoint.dart';
import 'package:fruitsapp/core/services/database_services.dart';
import 'package:fruitsapp/core/services/firebase_auth_services.dart';
import 'package:fruitsapp/features/auth/data/models/user_model.dart';
import 'package:fruitsapp/features/auth/domain/entities/user_entity.dart';
import 'package:fruitsapp/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseServices databaseServices;

  AuthRepoImpl({
    required this.databaseServices,
    required this.firebaseAuthServices,
  });
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailandPassword(
      String email, String password, String name) async {
    try {
      print('محاولة إنشاء مستخدم باستخدام البريد الإلكتروني: $email');
      var user = await firebaseAuthServices.createEmailandPassword(
        email: email,
        password: password,
      );
      if (user != null) {
        print('تم إنشاء المستخدم بنجاح: ${user.uid}');
        return right(UserModel.fromFirebaseUser(user));
      } else {
        print('فشل في إنشاء المستخدم: user is null');
        return left(ServerFailure(message: 'فشل في إنشاء المستخدم'));
      }
    } on CustomException catch (e) {
      log('CustomException in auth repo implmenentation: ${e.message}');
      print('تم رمي CustomException: ${e.message}');
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log("auth repo implmenentation: $e");
      print('حدث خطأ غير متوقع: $e');
      return left(ServerFailure(message: 'خطأ غير متوقع أثناء التسجيل: $e'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInEmailandPassword(
      {required String email, required String password}) async {
    try {
      print('محاولة تسجيل دخول باستخدام البريد الإلكتروني: $email');
      var user = await firebaseAuthServices.signInEmailandPassword(
        email: email,
        password: password,
      );
      if (user != null) {
        print('تم تسجيل دخول المستخدم بنجاح: ${user.uid}');
        var userEntity = UserModel.fromFirebaseUser(user);
        await addUser(user: userEntity);
        return right(userEntity);
      } else {
        print('فشل في تسجيل دخول المستخدم: user is null');
        return left(ServerFailure(message: 'فشل في تسجيل دخول المستخدم'));
      }
    } on CustomException catch (e) {
      log('CustomException in auth repo implmenentation: ${e.message}');
      print('تم رمي CustomException: ${e.message}');
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log("auth repo implmenentation: $e");
      print('حدث خطأ غير متوقع: $e');
      return left(ServerFailure(message: 'خطأ غير متوقع أثناء تسجيل دخول: $e'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthServices.signInWithGoogle();
      if (user != null) {
        print('تم إنشاء المستخدم بنجاح: ${user.uid}');
        return right(UserModel.fromFirebaseUser(user));
      } else {
        print('فشل في إنشاء المستخدم: user is null');
        return left(ServerFailure(message: 'فشل في إنشاء المستخدم'));
      }
    } catch (e) {
      log("auth repo implmenentation: $e");
      print('حدث خطأ غير متوقع: $e');
      return left(ServerFailure(message: 'خطأ غير متوقع أثناء التسجيل: $e'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    // TODO: implement signInWithFacebook
    try {
      var user = await firebaseAuthServices.signInWithFacebook();
      if (user != null) {
        print('تم إنشاء المستخدم بنجاح: ${user.uid}');
        return right(UserModel.fromFirebaseUser(user));
      } else {
        print('فشل في إنشاء المستخدم: user is null');
        return left(ServerFailure(message: 'فشل في إنشاء المستخدم'));
      }
    } catch (e) {
      log("auth repo implmenentation: $e");
      print('حدث خطأ غير متوقع: $e');
      return left(ServerFailure(message: 'خطأ غير متوقع أثناء التسجيل: $e'));
    }
  }

  @override
  Future addUser({required UserEntity user}) async {
    // TODO: implement addUser
    await databaseServices.addUser(
      path: BackendEndpoint.addUser,
      data: user.toMap(),
    );
  }
}
