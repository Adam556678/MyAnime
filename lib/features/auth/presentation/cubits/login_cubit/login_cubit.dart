import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:my_anime/core/strings/failure_messages.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      final credentials =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SuccessfulLogin());
    } on FirebaseAuthException catch (e) {
      emit(getFailureState(e));
    }
  }

  LoginState getFailureState(FirebaseAuthException exception) {
    if (exception.code == 'user-not-found' ||
        exception.code == 'wrong-password' ||
        exception.code == 'invalid-credential') {
      return LoginFailed(message: FailureMessages.wrongEmailOrPassword);
    }
    return LoginFailed(message: FailureMessages.undefinedError);
  }
}
