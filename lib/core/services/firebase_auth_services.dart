import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruitsapp/core/errors/custom_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  
  Future deleteUser()async{
    await FirebaseAuth.instance.currentUser!.delete();
  }
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

  Future<User?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user;
  }

  Future<User?> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user;
  }
}
