import 'package:flutter/material.dart';

class LoginRegisterImage extends StatelessWidget {
  const LoginRegisterImage({
    super.key,
    required this.size,
    required this.image,
  });
  final ImageProvider image;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: SizedBox(
        width: size,
        child: Image(image: image),
      )),
    );
  }
}
