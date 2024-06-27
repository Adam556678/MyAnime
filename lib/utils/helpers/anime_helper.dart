import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/enums.dart';
import 'package:my_anime/features/anime/domain/entities/anime.dart';
import 'package:my_anime/features/anime/presentation/widgets/anime_builders/favourites_grid_builder.dart';
import 'package:my_anime/features/anime/presentation/widgets/anime_builders/top_anime_grid_builder.dart';

class AnimeHelper {
  //get ListView Title
  static Widget getTitle(ChoiceEnum choice) {
    if (choice == ChoiceEnum.topAnime) {
      return const Text('TopAnime');
    } else if (choice == ChoiceEnum.favourites) {
      return const Text('Favourites');
    } else {
      return Container();
    }
  }

  //get Anime Grid
  static Widget getAnimeGrid(ChoiceEnum choice) {
    if (choice == ChoiceEnum.topAnime) {
      return const TopAnimeGridBuilder();
    } else if (choice == ChoiceEnum.favourites) {
      return const FavouritesGridBuilder();
    } else {
      return Container();
    }
  }

  static String getDurationInMinutes(String duration) {
    String durationMinutes = duration.split(' ')[0];
    return durationMinutes;
  }

  static bool containsAnime(List<Anime> list, int id) {
    for (Anime element in list) {
      if (element.id == id) {
        return true;
      }
    }
    return false;
  }
}
