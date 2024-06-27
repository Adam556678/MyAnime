import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppFavoriteButton extends StatelessWidget {
  final int id;
  final void Function()? onPressed;
  final Color color;
  const AppFavoriteButton({
    super.key,
    required this.id,
    this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        iconSize: 27,
        icon: Icon(
          Iconsax.heart5,
          color: color,
        ));
  }
}
