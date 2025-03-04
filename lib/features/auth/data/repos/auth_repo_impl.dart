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
      print('تم رمي CustomException: ${e.message}');
      return left(ServerFailure(message: e.message));
    } catch (e) {
      print('حدث خطأ غير متوقع: $e');
      return left(ServerFailure(message: 'خطأ غير متوقع أثناء التسجيل: $e'));
    }
  }
}
