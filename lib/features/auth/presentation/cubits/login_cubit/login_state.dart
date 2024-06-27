part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class SuccessfulLogin extends LoginState {}

final class LoginFailed extends LoginState {
  final String? message;

  LoginFailed({this.message});
}

final class LoginLoading extends LoginState {}
