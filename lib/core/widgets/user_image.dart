import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/images.dart';

class UserImage extends StatelessWidget {
  final double size;
  final File? image;
  final String? networkImage;
  const UserImage({
    super.key,
    required this.size,
    this.image,
    this.networkImage,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(150),
      child: image != null
          ? Image(
              width: size,
              height: size,
              image: FileImage(image!),
              fit: BoxFit.cover,
            )
          : networkImage != null && networkImage!.isNotEmpty
              ? Image.network(
                  networkImage!,
                  fit: BoxFit.cover,
                  width: size,
                  height: size,
                )
              : Image.asset(
                  AppImages.defaultUserImage,
                  fit: BoxFit.cover,
                  height: size,
                  width: size,
                ),
    );
  }
}
