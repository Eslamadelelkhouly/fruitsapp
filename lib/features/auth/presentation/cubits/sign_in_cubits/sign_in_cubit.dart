import 'package:bloc/bloc.dart';
import 'package:fruitsapp/features/auth/domain/entities/user_entity.dart';
import 'package:fruitsapp/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

  final AuthRepo authRepo;

  Future<void> signInEmailandPassword({
    required String email,
    required String password,
  }) async {
    print('بدء عملية تسجيل دخول...');
    emit(SignInLoading());
    final result = await authRepo.signInEmailandPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failures) {
        print('❌ فشل في تسجيل دخول: ${failures.message}');
        emit(SignInFailures(message: failures.message));
      },
      (userEntity) {
        print('✅ نجاح تسجيل دخول للمستخدم: ${userEntity.email}');
        emit(SignInSucess(user: userEntity));
      },
    );
  }

  Future<void> signInWithGoogle() async {
    print('بدء عملية تسجيل دخول...');
    emit(SignInLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failures) {
        print('❌ فشل في تسجيل دخول: ${failures.message}');
        emit(SignInFailures(message: failures.message));
      },
      (userEntity) {
        print('✅ نجاح تسجيل دخول للمستخدم: ${userEntity.email}');
        emit(SignInSucess(user: userEntity));
      },
    );
  }
}
