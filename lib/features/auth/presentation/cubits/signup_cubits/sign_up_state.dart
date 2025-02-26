part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSucess extends SignUpState {
  final UserEntity user;

  SignUpSucess({required this.user});
}

final class SignUpFailures extends SignUpState {
  final String message;

  SignUpFailures({required this.message});
}
