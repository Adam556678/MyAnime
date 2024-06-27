import 'package:flutter/material.dart';
import 'package:my_anime/core/styles/text_styles.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Icon? prefixIcon;
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    this.prefixIcon,
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
              backgroundColor: MaterialStateProperty.all(backgroundColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: prefixIcon ?? Container(),
              ),
              Text(
                text,
                style: AppTextStyles.loginRegisterButtonTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
