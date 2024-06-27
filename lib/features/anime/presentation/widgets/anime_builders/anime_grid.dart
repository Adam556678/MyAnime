import 'package:flutter/material.dart';
import 'package:my_anime/features/anime/data/models/anime_model.dart';
import 'package:my_anime/features/anime/presentation/widgets/anime_details_widgets/anime_rectangular_card.dart';

class AnimeGrid extends StatelessWidget {
  final List<AnimeModel> animeList;
  const AnimeGrid({super.key, required this.animeList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 17.0,
        crossAxisSpacing: 5.0,
        childAspectRatio: 1 / 2.1,
      ),
      itemCount: animeList.length,
      itemBuilder: (context, index) {
        final anime = animeList[index];
        return AnimeRectangularCard(anime: anime);
      },
    );
  }
}
