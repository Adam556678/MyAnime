import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/features/personalization/domain/entities/user.dart';
import 'package:my_anime/features/personalization/presentation/blocs/user_operations_bloc/user_operations_bloc.dart';
import 'package:my_anime/features/personalization/presentation/screens/user_creation_message_screen.dart';
import 'package:my_anime/utils/helpers/navigation_helper.dart';
import 'package:my_anime/utils/helpers/scaffold_messenger_helper.dart';
import 'package:my_anime/core/widgets/auth/login_register_button.dart';
import 'package:my_anime/core/widgets/auth/login_register_outline_button.dart';
import 'package:my_anime/core/widgets/text_form_field.dart';
import 'package:my_anime/features/auth/presentation/cubits/register_cubit/cubit/register_cubit.dart';
import 'package:my_anime/utils/validators/app_validator.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
    required this.size,
  });
  final Size size;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final reEnterPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      //listener
      listener: (context, state) {
        if (state is RegisterFailed) {
          ScaffoldMessengerHelper.showSnackbar(context, state.message);
        } else if (state is RegisterSucceed) {
          BlocProvider.of<UserOperationsBloc>(context)
              .add(AddUserEvent(user: state.user));
          NavigationHelper.navigateAndRemoveUntill(
              context, const UserCreationMessageScreen());
        }
      },

      //builder
      builder: (context, state) {
        bool loading = false;
        if (state is RegisterLoading) {
          loading = true;
        }

        //Register Form
        return Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppTextFormField(
                        text: 'First Name',
                        controller: firstNameController,
                        prefixIcon: Iconsax.user,
                        validator: (value) => AppValidator.validateName(value),
                      ),
                    ),
                    SizedBox(
                      width: widget.size.width * 0.01,
                    ),
                    Expanded(
                      child: AppTextFormField(
                          text: 'Last Name',
                          controller: lastNameController,
                          prefixIcon: Iconsax.user,
                          validator: (value) =>
                              AppValidator.validateName(value)),
                    ),
                  ],
                ),
                SizedBox(
                  height: widget.size.height * 0.01,
                ),
                AppTextFormField(
                  text: 'E-mail',
                  controller: emailController,
                  prefixIcon: Icons.mail,
                  validator: (val) => AppValidator.validateEmail(val),
                ),
                SizedBox(
                  height: widget.size.height * 0.01,
                ),
                AppTextFormField(
                  text: 'Password',
                  controller: passwordController,
                  prefixIcon: Icons.lock,
                  secured: true,
                  validator: (password) =>
                      AppValidator.validatePassword(password),
                ),
                SizedBox(
                  height: widget.size.height * 0.01,
                ),
                AppTextFormField(
                  text: 'Re-enter Password',
                  controller: reEnterPasswordController,
                  prefixIcon: Icons.lock,
                  secured: true,
                  validator: (passwordConfirmation) =>
                      AppValidator.confirmPassword(
                          passwordController.text, passwordConfirmation),
                ),
                SizedBox(
                  height: widget.size.height * 0.03,
                ),
                AppFormButton(
                    text: 'Signup',
                    isLoading: loading,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final user = UserEntity(
                            firstName: firstNameController.text,
                            email: emailController.text,
                            bio: '',
                            lastName: lastNameController.text,
                            userPhoto: '');
                        BlocProvider.of<RegisterCubit>(context).register(
                            user,
                            passwordController.text,
                            reEnterPasswordController.text);
                      }
                    }),
                const SizedBox(
                  height: AppSizes.sm,
                ),
                LoginRegisterOutlineButton(
                    text: 'Login',
                    onPressed: () => NavigationHelper.navigateBack(context))
              ],
            ));
      },
    );
  }
}
