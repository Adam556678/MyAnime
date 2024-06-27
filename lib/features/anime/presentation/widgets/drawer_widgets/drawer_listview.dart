import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/drawer_items.dart';
import 'package:my_anime/utils/helpers/navigation_helper.dart';

class DrawerListView extends StatelessWidget {
  const DrawerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: DrawerItems.drawerItems.length,
        itemBuilder: (context, index) {
          DrawerItem item = DrawerItems.drawerItems[index];
          return ListTile(
            leading: item.icon,
            title: Text(item.title),
            onTap: () => NavigationHelper.navigateTo(context, item.screen),
          );
        });
  }
}
