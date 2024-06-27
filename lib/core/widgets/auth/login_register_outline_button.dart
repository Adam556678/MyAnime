import 'package:flutter/material.dart';
import 'package:my_anime/core/styles/text_styles.dart';
import 'package:my_anime/core/theme/colors.dart';

class LoginRegisterOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const LoginRegisterOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45.0),
      child: SizedBox(
          width: double.infinity,
          height: 55,
          child: OutlinedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                  side: MaterialStateProperty.all(
                      const BorderSide(color: AppColors.purple, width: 1.5))),
              child: Text(
                text,
                style: AppTextStyles.loginRegisterButtonTextStyle
                    .apply(color: AppColors.purple),
              ))),
    );
  }
}
