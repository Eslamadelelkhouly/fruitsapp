import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        var userEntity = UserEntity(
          email: email,
          name: name,
          Uid: user.uid,
        );
        await addUser(user: userEntity);
        print('تم إنشاء المستخدم بنجاح: ${user.uid}');
        return right(userEntity);
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
    User? user;
    try {
      print('محاولة تسجيل دخول باستخدام البريد الإلكتروني: $email');
      user = await firebaseAuthServices.signInEmailandPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUser(Uid: user!.uid);

      if (user != null) {
        print('تم تسجيل دخول المستخدم بنجاح: ${user.uid}');
        return right(userEntity);
      } else {
        print('فشل في تسجيل دخول المستخدم: user is null');
        return left(ServerFailure(message: 'فشل في تسجيل دخول المستخدم'));
      }
    } on CustomException catch (e) {
      log('CustomException in auth repo implmenentation: ${e.message}');
      print('تم رمي CustomException: ${e.message}');
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log("auth repo implmenentation: $e");
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      print('حدث خطأ غير متوقع: $e');
      return left(ServerFailure(message: 'خطأ غير متوقع أثناء تسجيل دخول: $e'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithGoogle();
      if (user != null) {
        var userEntity = UserModel.fromFirebaseUser(user);
        await addUser(user: userEntity);
        print('تم إنشاء المستخدم بنجاح: ${user.uid}');
        return right(userEntity);
      } else {
        print('فشل في إنشاء المستخدم: user is null');
        return left(ServerFailure(message: 'فشل في إنشاء المستخدم'));
      }
    } catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      log("auth repo implmenentation: $e");
      print('حدث خطأ غير متوقع: $e');
      return left(ServerFailure(message: 'خطأ غير متوقع أثناء التسجيل: $e'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      User? user;
      user = await firebaseAuthServices.signInWithFacebook();
      if (user != null) {
        var userEntity = UserModel.fromFirebaseUser(user);
        await addUser(user: userEntity);
        print('تم إنشاء المستخدم بنجاح: ${user.uid}');
        return right(UserModel.fromFirebaseUser(user));
      } else {
        print('فشل في إنشاء المستخدم: user is null');
        return left(ServerFailure(message: 'فشل في إنشاء المستخدم'));
      }
    } catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
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

  @override
  Future<UserEntity> getUser({required String Uid}) async {
    var userData = await databaseServices.getData(
      path: BackendEndpoint.addUser,
      documentId: Uid,
    );
    return UserModel.fromJson(userData);
  }
}
