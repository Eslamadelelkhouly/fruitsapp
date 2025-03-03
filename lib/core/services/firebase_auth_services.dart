import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitsapp/core/errors/custom_exception.dart';

class FirebaseAuthServices {
  Future<User> createEmailandPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'البريد الالكتروني مستخدم');
      } else {
        throw CustomException(message: 'مشكلة في انشاء الحساب'); 
      }
    } catch (e) {
      throw CustomException(message: 'مشكلة في انشاء الحساب');
    }
  }
}
