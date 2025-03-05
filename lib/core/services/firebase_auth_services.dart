import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitsapp/core/errors/custom_exception.dart';

class FirebaseAuthServices {
  Future<User?> createEmailandPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.message}');
      if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'البريد الإلكتروني مستخدم بالفعل');
      } else if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة');
      } else {
        throw CustomException(message: 'حدث خطأ في Firebase: ${e.message}');
      }
    } catch (e) {
      log('حدث خطأ غير متوقع: ${e.toString()}');
      throw CustomException(message: 'حدث خطأ غير متوقع: ${e.toString()}');
    }
  }

  Future<User?> signInEmailandPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.message}');
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'كلمة المرور او البريد الالكتروني غير صحيحة');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'كلمة المرور او البريد الالكتروني غير صحيحة');
      } else {
        throw CustomException(message: 'حدث خطأ في Firebase: ${e.message}');
      }
    } catch (e) {
      log('حدث خطأ غير متوقع: ${e.toString()}');
      throw CustomException(message: 'حدث خطأ غير متوقع: ${e.toString()}');
    }
  }
}
