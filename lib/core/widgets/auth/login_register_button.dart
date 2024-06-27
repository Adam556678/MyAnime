import 'package:flutter/material.dart';
import 'package:my_anime/core/styles/text_styles.dart';
import 'package:my_anime/core/theme/colors.dart';

class AppFormButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  const AppFormButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45.0),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.purple)),
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  text,
                  style: AppTextStyles.loginRegisterButtonTextStyle,
                ),
        ),
      ),
    );
  }
}
