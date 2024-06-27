import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/widgets/loading_indicator.dart';
import 'package:my_anime/features/anime/data/models/anime_model.dart';
import 'package:my_anime/features/anime/presentation/cubit/random_anime_cubit/random_anime_cubit.dart';
import 'package:my_anime/features/anime/presentation/screens/anime_details.dart';
import 'package:my_anime/features/anime/presentation/widgets/home_widgets/anime_card.dart';
import 'package:my_anime/features/anime/presentation/widgets/random_anime_widgets/random_anime_synopsis_button.dart';
import 'package:my_anime/utils/helpers/navigation_helper.dart';

class RandomAnimeCard extends StatelessWidget {
  final Size size;
  const RandomAnimeCard({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomAnimeCubit, RandomAnimeState>(
      builder: (context, state) {
        if (state is LoadingRandomAnime) {
          return const SizedBox(
              height: AppSizes.animeImageHeight, child: LoadingIndicator());
        } else if (state is RandomAnimeFetched) {
          final anime = state.randomAnime;
          return RandomCard(anime: anime);
        } else if (state is FailedToFetchRandomAnime) {
          return SizedBox(
            child: Text(state.message),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class RandomCard extends StatelessWidget {
  const RandomCard({
    super.key,
    required this.anime,
  });

  final AnimeModel anime;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        SizedBox(
          height: AppSizes.animeImageHeight * 1.2,
          child: GestureDetector(
            onTap: () {
              NavigationHelper.navigateTo(context, AnimeDetails(anime: anime));
            },
            child: AnimeCard(
              imageheight: AppSizes.animeImageHeight * 1.2,
              width: AppSizes.animeImageWidth * 1.2,
              image: anime.images.imageUrl,
              title: anime.title,
              id: anime.id,
              favouriteColor: Colors.white,
              rate: anime.score,
              year: anime.year,
            ),
          ),
        ),
        SynopsisButton(
          synopsis: anime.synopsis,
        )
      ]),
    );
  }
}
