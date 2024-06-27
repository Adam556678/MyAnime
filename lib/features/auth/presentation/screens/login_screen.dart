import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/strings/app_strings.dart';
import 'package:my_anime/core/styles/text_styles.dart';
import 'package:my_anime/core/widgets/login_register_image_widget.dart';
import 'package:my_anime/features/auth/presentation/widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ImageProvider image = const AssetImage(AppStrings.loginImage);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Image
              LoginRegisterImage(
                size: size.width * 0.55,
                image: image,
              ),

              //Title
              const Text(
                AppStrings.loginText,
                style: AppTextStyles.loginAndRegisterTextStyle,
              ),

              SizedBox(
                height: size.height * 0.05,
              ),

              LoginForm(size: size)
            ],
          ),
        ),
      ),
    );
  }
}
