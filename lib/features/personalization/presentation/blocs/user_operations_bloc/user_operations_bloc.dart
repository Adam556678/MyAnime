import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/core/strings/failure_messages.dart';
import 'package:my_anime/features/personalization/data/models/user_model.dart';
import 'package:my_anime/features/personalization/domain/entities/user.dart';
import 'package:my_anime/features/personalization/domain/usecases/add_user_usecase.dart';
import 'package:my_anime/features/personalization/domain/usecases/get_user_details_usecase.dart';
import 'package:my_anime/features/personalization/domain/usecases/update_user_usecase.dart';

part 'user_operations_event.dart';
part 'user_operations_state.dart';

class UserOperationsBloc
    extends Bloc<UserOperationsEvent, UserOperationsState> {
  final AddUserUsecase addUserUsecase;
  final UpdateUserUsecase updateUserUsecase;
  final GetUserDetailsUseCase getUserDetailsUsecase;
  UserOperationsBloc(
      {required this.getUserDetailsUsecase,
      required this.addUserUsecase,
      required this.updateUserUsecase})
      : super(UserOperationsInitial()) {
    on<UserOperationsEvent>((event, emit) async {
      emit(LoadingUserOperationState());
      if (event is AddUserEvent) {
        final userAddedOrFailed = await addUserUsecase(event.user);
        emit(emitAddUserState(userAddedOrFailed));
      } else if (event is EditUserEvent) {
        final userUpdatedOrFailed =
            await updateUserUsecase(event.user, event.image);
        emit(emitUpdateUserState(userUpdatedOrFailed));
      } else if (event is GetUserDetailsEvent) {
        final userDetails = await getUserDetailsUsecase(event.userEmail);
        emit(emitGetUserDetailsState(userDetails));
      }
    });
  }

  UserOperationsState emitAddUserState(
      Either<Failure, Unit> userAddedOrFailed) {
    return userAddedOrFailed.fold(
        (failure) => ErrorUserOperationState(
            errorMessage: _mapFailureToMessage(failure)),
        (unit) => SuccessfulUserOperationState());
  }

  UserOperationsState emitUpdateUserState(
      Either<Failure, Unit> userUpdatedOrFailed) {
    return userUpdatedOrFailed.fold(
        (failure) => ErrorUserOperationState(
            errorMessage: _mapFailureToMessage(failure)),
        (unit) => SuccessfulUserOperationState());
  }

  UserOperationsState emitGetUserDetailsState(
      Either<Failure, UserModel> userDetails) {
    return userDetails.fold(
        (failure) => ErrorUserOperationState(
            errorMessage: _mapFailureToMessage(failure)),
        (user) => UserDetailedFetchedState(user: user));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return FailureMessages.serverFailureMessage;
      case OfflineFailure:
        return FailureMessages.offlineFailureMessage;
      default:
        return FailureMessages.undefinedError;
    }
  }
}
