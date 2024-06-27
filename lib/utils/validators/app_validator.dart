import 'package:my_anime/utils/extensions/string_extensions.dart';

class AppValidator {
  static String? validateEmail(String? email) {
    if (email == null || !email.isValidEmail) return 'Email not valid';

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || !password.isValidPassword) {
      return 'Password is weak';
    }

    return null;
  }

  static String? confirmPassword(
      String? password, String? passwordConfirmation) {
    if (password != passwordConfirmation) {
      return 'Passwords don\'t match';
    }

    return null;
  }

  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'this field can\'t be empty';
    }

    return null;
  }
}
