part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterSucceed extends RegisterState {
  final UserEntity user;

  RegisterSucceed({required this.user});
}

final class RegisterLoading extends RegisterState {}

final class RegisterFailed extends RegisterState {
  final String message;

  RegisterFailed({
    required this.message,
  });
}
