import 'package:flutter/material.dart';
import 'package:my_anime/core/strings/drawer_strings.dart';

class DrawerLogoutItem extends StatelessWidget {
  const DrawerLogoutItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: Colors.redAccent,
      textColor: Colors.redAccent,
      leading: const Icon(Icons.exit_to_app_outlined),
      title: const Text(DrawerStrings.logout),
      onTap: () {},
    );
  }
}
