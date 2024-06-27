import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/strings/app_strings.dart';
import 'package:my_anime/core/widgets/app_button.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.1),
            const Image(image: AssetImage(AppStrings.errorImage)),
            ErrorTextWidget(errorMessage: errorMessage),
            const Spacer(),
            AppButton(
              text: 'Get Back',
              onPressed: () {},
              backgroundColor: Colors.red,
              prefixIcon: const Icon(Iconsax.arrow_left, color: Colors.white),
            ),
            SizedBox(height: size.height * 0.07)
          ],
        ),
      ),
    );
  }
}

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Oops!',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
              color: Colors.red),
        ),
        const SizedBox(height: AppSizes.md),
        Text(
          errorMessage,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
