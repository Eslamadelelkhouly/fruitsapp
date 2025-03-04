import 'package:bloc/bloc.dart';
import 'package:fruitsapp/features/auth/domain/entities/user_entity.dart';
import 'package:fruitsapp/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepo authRepo;
  Future<void> createUserWithEmailandPassword(
      String email, String password, String name) async {
    emit(SignUpLoading());
    print('بدء عملية التسجيل...');
    final result = await authRepo.createUserWithEmailandPassword(
      email,
      password,
      name,
    );

    result.fold(
      (failures) {
        print('❌ فشل في التسجيل: ${failures.message}');
        emit(SignUpFailures(message: failures.message));
      },
      (userEntity) {
        print('✅ نجاح التسجيل للمستخدم: ${userEntity.email}');
        emit(SignUpSucess(user: userEntity));
      },
    );
  }
}
