import 'package:flutter/material.dart';

class OnBoardingBackground extends StatelessWidget {
  final ImageProvider image;
  const OnBoardingBackground({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: image,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
    );
  }
}
