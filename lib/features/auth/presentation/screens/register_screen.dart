import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/strings/app_strings.dart';
import 'package:my_anime/core/styles/text_styles.dart';
import 'package:my_anime/core/widgets/login_register_image_widget.dart';
import 'package:my_anime/features/auth/presentation/widgets/register_form_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ImageProvider image = const AssetImage(AppStrings.registerImage);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultPadding),
          child: Column(
            children: [
              //Image
              LoginRegisterImage(
                size: size.width * 0.4,
                image: image,
              ),

              //Title
              const Text(
                AppStrings.registerText,
                style: AppTextStyles.loginAndRegisterTextStyle,
              ),

              SizedBox(
                height: size.height * 0.03,
              ),

              //Form
              RegisterForm(size: size)
            ],
          ),
        ),
      ),
    );
  }
}
