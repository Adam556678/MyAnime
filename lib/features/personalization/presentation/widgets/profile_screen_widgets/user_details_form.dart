import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:my_anime/core/theme/colors.dart';
import 'package:my_anime/core/widgets/auth/login_register_button.dart';
import 'package:my_anime/core/widgets/text_form_field.dart';
import 'package:my_anime/core/widgets/user_image.dart';
import 'package:my_anime/features/personalization/domain/entities/user.dart';
import 'package:my_anime/features/personalization/domain/entities/user_phone_number.dart';
import 'package:my_anime/features/personalization/presentation/blocs/user_operations_bloc/user_operations_bloc.dart';
import 'package:my_anime/utils/helpers/image_pciker.dart';
import 'package:my_anime/utils/helpers/scaffold_messenger_helper.dart';
import 'package:my_anime/utils/helpers/users_hepler.dart';
import 'package:my_anime/utils/validators/app_validator.dart';

class UserDetailsForm extends StatefulWidget {
  const UserDetailsForm({
    super.key,
    required this.size,
    required this.user,
  });
  final UserEntity user;
  final Size size;

  @override
  State<UserDetailsForm> createState() => _UserDetailsFormState();
}

class _UserDetailsFormState extends State<UserDetailsForm> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  UserPhoneNumber? userPhoneNumber;
  final _formKey = GlobalKey<FormState>();

  FocusNode focusNode = FocusNode();

  File? image;

  @override
  void initState() {
    assignControllerTexts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //--user Image
        Center(
          child: SizedBox(
            height: 150,
            child: Stack(children: [
              UserImage(
                  size: 150, image: image, networkImage: widget.user.userPhoto),
              Positioned(
                right: 0,
                bottom: 0,
                child: IconButton(
                    onPressed: () => selectImage(),
                    icon: const Icon(
                      Icons.add_a_photo,
                      color: AppColors.darkGrey,
                      size: 35,
                    )),
              )
            ]),
          ),
        ),

        SizedBox(
          height: widget.size.height * 0.05,
        ),
        Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppTextFormField(
                        text: 'First Name',
                        prefixIcon: Iconsax.user,
                        controller: firstNameController,
                        validator: (value) => AppValidator.validateName(value),
                      ),
                    ),
                    SizedBox(
                      width: widget.size.width * 0.01,
                    ),
                    Expanded(
                      child: AppTextFormField(
                        text: 'Last Name',
                        prefixIcon: Iconsax.user,
                        controller: lastNameController,
                        validator: (value) => AppValidator.validateName(value),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: widget.size.height * 0.03,
                ),
                IntlPhoneField(
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  languageCode: "en",
                  initialCountryCode: widget.user.phoneNumber!.isoCode,
                  initialValue: widget.user.phoneNumber!.number,
                  onChanged: (phone) {
                    userPhoneNumber = UserPhoneNumber(
                        code: phone.countryCode,
                        isoCode: phone.countryISOCode,
                        number: phone.number);
                  },
                ),
                SizedBox(
                  height: widget.size.height * 0.03,
                ),
                AppTextFormField(
                  text: 'User bio',
                  maxLines: 4,
                  controller: bioController,
                ),
                SizedBox(
                  height: widget.size.height * 0.05,
                ),
                AppFormButton(
                    text: 'Save',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (userPhoneNumber != null &&
                            userPhoneNumber!.number.isNotEmpty) {
                          updateUserDetails();
                        } else {
                          ScaffoldMessengerHelper.showSnackbar(
                              context, 'Number can\'t be Empty');
                        }
                      }
                    })
              ],
            )),
      ],
    );
  }

  void assignControllerTexts() {
    firstNameController.text = widget.user.firstName;
    lastNameController.text = widget.user.lastName;
    bioController.text = widget.user.bio;
  }

  void updateUserDetails() {
    //assign user details to an entity
    UserEntity updatedUser = UserEntity(
        firstName: firstNameController.text,
        email: UsersHelper.getUserEmail(),
        phoneNumber: userPhoneNumber,
        bio: bioController.text,
        lastName: lastNameController.text,
        userPhoto: '');

    //trigger update user Event
    BlocProvider.of<UserOperationsBloc>(context)
        .add(EditUserEvent(user: updatedUser, image: image));
  }

  void selectImage() async {
    File? img = await ImagePcikerHelper.pickImage(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }
}
