import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_anime/core/theme/colors.dart';
import 'package:my_anime/core/widgets/user_image.dart';
import 'package:my_anime/utils/helpers/image_pciker.dart';

class UserImageAndCameraIcon extends StatefulWidget {
  const UserImageAndCameraIcon({
    super.key,
  });

  @override
  State<UserImageAndCameraIcon> createState() => _UserImageAndCameraIconState();
}

class _UserImageAndCameraIconState extends State<UserImageAndCameraIcon> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 150,
        child: Stack(children: [
          UserImage(size: 150, image: image),
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
    );
  }

  void selectImage() async {
    File? img = await ImagePcikerHelper.pickImage(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }
}
