part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSucess extends SignInState {
  final UserEntity user;
  SignInSucess({required this.user});
}

final class SignInFailures extends SignInState {
  final String message;
  SignInFailures({required this.message});
}
