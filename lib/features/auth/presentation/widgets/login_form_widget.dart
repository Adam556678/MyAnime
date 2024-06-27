import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/utils/helpers/navigation_helper.dart';
import 'package:my_anime/utils/helpers/scaffold_messenger_helper.dart';
import 'package:my_anime/core/widgets/auth/login_register_button.dart';
import 'package:my_anime/core/widgets/auth/login_register_outline_button.dart';
import 'package:my_anime/core/widgets/text_form_field.dart';
import 'package:my_anime/features/anime/presentation/screens/home_page_screen.dart';
import 'package:my_anime/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:my_anime/features/auth/presentation/screens/register_screen.dart';
import 'package:my_anime/features/auth/presentation/widgets/forgot_password_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  bool failed = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      //Listener
      listener: (context, state) {
        if (state is SuccessfulLogin) {
          isLoading = false;
          NavigationHelper.navigateAndRemoveUntill(context, const HomeScreen());
        } else if (state is LoginFailed) {
          ScaffoldMessengerHelper.showSnackbar(context, state.message!);
        }
      },

      //Builder
      builder: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
          failed = false;
        } else if (state is LoginFailed) {
          isLoading = false;
          failed = true;
        }

        return Form(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextFormField(
              text: 'E-mail',
              controller: emailController,
              prefixIcon: Icons.mail,
              borderColor: failed ? Colors.red : null,
            ),
            SizedBox(
              height: widget.size.height * 0.03,
            ),
            AppTextFormField(
              text: 'Password',
              controller: passwordController,
              secured: true,
              prefixIcon: Icons.lock,
              borderColor: failed ? Colors.red : null,
            ),
            const SizedBox(
              height: 7,
            ),
            ForgotPasswordText(invalid: failed),
            SizedBox(
              height: widget.size.height * 0.05,
            ),
            AppFormButton(
              text: 'Login',
              isLoading: isLoading,
              onPressed: () => BlocProvider.of<LoginCubit>(context).login(
                  email: emailController.text,
                  password: passwordController.text),
            ),
            const SizedBox(
              height: AppSizes.sm,
            ),
            LoginRegisterOutlineButton(
              text: 'Signup',
              onPressed: () =>
                  NavigationHelper.navigateTo(context, const RegisterScreen()),
            )
          ],
        ));
      },
    );
  }
}
