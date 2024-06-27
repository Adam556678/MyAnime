import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/sizes.dart';

class AppBarMenuButton extends StatelessWidget {
  const AppBarMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(
          Icons.menu,
          size: AppSizes.menuIconSize,
          color: Colors.white,
        ));
  }
}
