import 'package:flutter/material.dart';
import 'package:my_anime/core/theme/colors.dart';

class ForgotPasswordText extends StatelessWidget {
  final bool invalid;
  const ForgotPasswordText({
    super.key,
    required this.invalid,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          "Forgot Password?",
          style: TextStyle(
            color: AppColors.purple.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}
