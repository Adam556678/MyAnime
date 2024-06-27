import 'package:flutter/material.dart';
import 'package:my_anime/core/theme/colors.dart';

class CurvedBackground extends StatelessWidget {
  const CurvedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    // return ClipPath(clipper: AppBezierClipper(), child: Container());
    return ClipPath(
      clipper: AppBezierClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: double.infinity,
        color: AppColors.purple,
      ),
    );
  }
}

class AppBezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);

    //quadraticBezier
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 2);

    //line to top right
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
