part of 'user_operations_bloc.dart';

@immutable
sealed class UserOperationsEvent {}

class AddUserEvent extends UserOperationsEvent {
  final UserEntity user;

  AddUserEvent({required this.user});
}

class EditUserEvent extends UserOperationsEvent {
  final UserEntity user;
  final File? image;

  EditUserEvent({this.image, required this.user});
}

class DeleteUserEvent extends UserOperationsEvent {
  final String userEmail;

  DeleteUserEvent({required this.userEmail});
}

class GetUserDetailsEvent extends UserOperationsEvent {
  final String userEmail;

  GetUserDetailsEvent({required this.userEmail});
}
