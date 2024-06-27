import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/features/anime/data/models/anime_model.dart';
import 'package:my_anime/features/anime/domain/entities/anime.dart';
import 'package:my_anime/features/anime/presentation/bloc/favourites_bloc/favourites_bloc.dart';
import 'package:my_anime/utils/helpers/anime_helper.dart';
import 'package:my_anime/utils/helpers/favorites_helper.dart';
import 'package:my_anime/utils/helpers/navigation_helper.dart';
import 'package:my_anime/features/anime/presentation/screens/anime_details.dart';
import 'package:my_anime/features/anime/presentation/widgets/home_widgets/anime_card.dart';

class AnimeListView extends StatelessWidget {
  final List<AnimeModel> animeList;
  const AnimeListView({
    super.key,
    required this.animeList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.listViewHeight,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: animeList.length > 10 ? 10 : animeList.length,
          itemBuilder: (context, index) {
            //get anime data
            final anime = animeList[index];

            return GestureDetector(
              onTap: () => NavigationHelper.navigateTo(
                  context,
                  AnimeDetails(
                    anime: anime,
                  )),
              child: BlocBuilder<FavouritesBloc, FavouritesState>(
                builder: (context, state) {
                  List<Anime> favorites = [];

                  //assign favorites on state is changing
                  if (state is FavouritesFetched) {
                    favorites = state.favorites;
                  }

                  //check if anime is favourite
                  bool isFavourite =
                      AnimeHelper.containsAnime(favorites, anime.id);

                  //Anime Card
                  return AnimeCard(
                    //color is red if favourite
                    favouriteColor: isFavourite ? Colors.red : Colors.white,

                    //remove if favourite else add to favorites
                    favouriteOnPressed: () => isFavourite
                        ? FavouritesHelper.removeFavourite(context, anime.id)
                        : FavouritesHelper.addFavourite(context, anime.id),

                    //anime details
                    id: anime.id,
                    rate: anime.score,
                    year: anime.year,
                    image: anime.images.imageUrl,
                    title: anime.title,
                  );
                },
              ),
            );
          }),
    );
  }
}
