import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:my_anime/core/strings/failure_messages.dart';
import 'package:my_anime/features/personalization/domain/entities/user.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> register(
      UserEntity user, String password, String repeatPassword) async {
    emit(RegisterLoading());

    if (password != repeatPassword) {
      emit(RegisterFailed(message: FailureMessages.passwordNotMatched));
    } else {
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: user.email, password: password);
        emit(RegisterSucceed(user: user));
      } on FirebaseAuthException catch (e) {
        emit(getFailureState(e));
      }
    }
  }

  RegisterState getFailureState(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      return RegisterFailed(
        message: FailureMessages.weakPassword,
      );
    } else if (e.code == 'email-already-in-use') {
      return RegisterFailed(
        message: FailureMessages.emailUsed,
      );
    }
    return RegisterFailed(
      message: FailureMessages.undefinedError,
    );
  }
}
