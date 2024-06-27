import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_anime/features/anime/domain/entities/anime.dart';
import 'package:my_anime/features/anime/presentation/bloc/favourites_bloc/favourites_bloc.dart';
import 'package:my_anime/features/anime/presentation/widgets/anime_details_widgets/anime_details_body.dart';
import 'package:my_anime/features/comments/presentation/bloc/comment_bloc/comment_bloc.dart';
import 'package:my_anime/features/comments/presentation/widgets/comments_sheet.dart';
import 'package:my_anime/utils/helpers/anime_helper.dart';
import 'package:my_anime/utils/helpers/favorites_helper.dart';

class AnimeDetails extends StatelessWidget {
  final Anime anime;
  const AnimeDetails({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(anime.title),
        actions: [
          IconButton(
            onPressed: () {
              //Trigger Bloc
              BlocProvider.of<CommentBloc>(context)
                  .add(GetAllCommentsEvent(animeId: anime.id));

              //Show Bottom sheet
              CommentsSheet.showBottomSheet(context, anime.id);
            },
            icon: const Icon(Icons.comment),
          ),
          BlocBuilder<FavouritesBloc, FavouritesState>(
            builder: (context, state) {
              List<Anime> favorites = [];

              //assign favorites on state is changing
              if (state is FavouritesFetched) {
                favorites = state.favorites;
              }

              //check if anime is favourite
              bool isFavourite = AnimeHelper.containsAnime(favorites, anime.id);

              return IconButton(
                onPressed: () => isFavourite
                    ? FavouritesHelper.removeFavourite(context, anime.id)
                    : FavouritesHelper.addFavourite(context, anime.id),
                icon: Icon(
                  Icons.favorite,
                  color: isFavourite ? Colors.red : Colors.white,
                ),
              );
            },
          ),
        ],
      ),
      body: AnimeDetailsBody(anime: anime),
    );
  }
}
