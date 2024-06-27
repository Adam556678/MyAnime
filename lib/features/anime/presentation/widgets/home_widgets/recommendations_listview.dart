import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/features/anime/data/models/recommendations_model.dart';
import 'package:my_anime/features/anime/domain/entities/anime.dart';
import 'package:my_anime/features/anime/presentation/bloc/favourites_bloc/favourites_bloc.dart';
import 'package:my_anime/features/anime/presentation/cubit/anime_details_cubit/anime_details_cubit.dart';
import 'package:my_anime/features/anime/presentation/widgets/home_widgets/anime_card.dart';
import 'package:my_anime/features/anime/presentation/widgets/recommendations/recommended_details.dart';
import 'package:my_anime/utils/helpers/anime_helper.dart';
import 'package:my_anime/utils/helpers/favorites_helper.dart';
import 'package:my_anime/utils/helpers/navigation_helper.dart';

class RecommendationsListView extends StatelessWidget {
  final List<RecommendedAnime> recommendations;
  const RecommendationsListView({
    super.key,
    required this.recommendations,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.listViewHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          //get anime data
          RecommendedAnime anime = recommendations[index];

          return GestureDetector(
            onTap: () => animeCardOnPressed(context, anime),
            child: BlocBuilder<FavouritesBloc, FavouritesState>(
              builder: (context, state) {
                List<Anime> favorites = [];
                //assign favorites to the list
                if (state is FavouritesFetched) {
                  favorites = state.favorites;
                }

                //check if anime is favourite
                bool isFavourite =
                    AnimeHelper.containsAnime(favorites, anime.id);

                return AnimeCard(
                  favouriteColor: isFavourite ? Colors.red : Colors.white,
                  id: anime.id,
                  image: anime.images.imageUrl,
                  title: anime.title,
                  favouriteOnPressed: () => isFavourite
                      ? FavouritesHelper.removeFavourite(context, anime.id)
                      : FavouritesHelper.addFavourite(context, anime.id),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void animeCardOnPressed(BuildContext context, RecommendedAnime anime) {
    //trigger Anime Details Cubit
    BlocProvider.of<AnimeDetailsCubit>(context).getAnimeDetails(anime.id);

    //navigate to Anime Details Screen
    NavigationHelper.navigateTo(context, const RecommendedDetailsScreen());
  }
}
