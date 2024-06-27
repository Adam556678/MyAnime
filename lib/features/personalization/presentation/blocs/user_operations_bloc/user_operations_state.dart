part of 'user_operations_bloc.dart';

@immutable
sealed class UserOperationsState {}

final class UserOperationsInitial extends UserOperationsState {}

final class SuccessfulUserOperationState extends UserOperationsState {}

final class ErrorUserOperationState extends UserOperationsState {
  final String errorMessage;

  ErrorUserOperationState({required this.errorMessage});
}

final class LoadingUserOperationState extends UserOperationsState {}

final class UserDetailedFetchedState extends UserOperationsState {
  final UserModel user;

  UserDetailedFetchedState({required this.user});
}
