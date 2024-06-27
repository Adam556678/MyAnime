import 'package:firebase_auth/firebase_auth.dart';

final user = FirebaseAuth.instance.currentUser;

class UsersHelper {
  static String getUserEmail() {
    return user!.email ?? '';
  }
}
