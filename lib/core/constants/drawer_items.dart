import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_anime/core/constants/enums.dart';
import 'package:my_anime/core/strings/drawer_strings.dart';
import 'package:my_anime/features/anime/presentation/screens/anime_grid_screen.dart';
import 'package:my_anime/features/anime/presentation/screens/categories_page.dart';
import 'package:my_anime/features/anime/presentation/screens/random_anime.dart';
import 'package:my_anime/features/personalization/presentation/screens/profile_screen.dart';

class DrawerItem {
  final Icon icon;
  final String title;
  Widget screen;
  DrawerItem({
    required this.icon,
    required this.title,
    required this.screen,
  });
}

class DrawerItems {
  static List<DrawerItem> drawerItems = [
    DrawerItem(
        icon: const Icon(Iconsax.user),
        title: DrawerStrings.userAccount,
        screen: const ProfileScreen()),
    DrawerItem(
      icon: const Icon(Iconsax.category),
      title: DrawerStrings.animeCateg,
      screen: const AnimeCategories(),
    ),
    DrawerItem(
      icon: const Icon(Iconsax.shuffle),
      title: DrawerStrings.randomAnime,
      screen: const RandomAnimeScreen(),
    ),
    DrawerItem(
      icon: const Icon(Iconsax.star),
      title: DrawerStrings.favoriteAnime,
      screen: const AnimeGridScreen(choice: ChoiceEnum.favourites),
    ),
  ];
}
