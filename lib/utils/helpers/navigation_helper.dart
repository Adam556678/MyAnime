import 'package:flutter/material.dart';

class NavigationHelper {
  static void navigateTo(BuildContext context, screen) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }

  static void navigateAndRemoveUntill(BuildContext context, screen) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => screen,
        ),
        (route) => false);
  }

  static void navigateBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void replace(BuildContext context, screen) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }
}
