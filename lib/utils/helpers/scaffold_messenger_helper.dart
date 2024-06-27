import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/duration_constants.dart';

class ScaffoldMessengerHelper {
  static void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: DurationConstants.snackBarDuration),
    ));
  }
}
