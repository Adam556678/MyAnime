import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/features/anime/domain/entities/anime.dart';
import 'package:my_anime/features/anime/presentation/widgets/anime_details_widgets/anime_genre.dart';

class GenresBuilder extends StatelessWidget {
  final List<Genre> genres;
  const GenresBuilder({
    super.key,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context, index) {
            final currentGenre = genres[index];

            return Container(
                margin: const EdgeInsets.only(right: AppSizes.sm),
                child: AnimeGenre(genreName: currentGenre.name));
          }),
    );
  }
}
