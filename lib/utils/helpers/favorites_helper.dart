import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/features/anime/presentation/bloc/favourites_bloc/favourites_bloc.dart';

class FavouritesHelper {
  static void removeFavourite(BuildContext context, int animeId) {
    BlocProvider.of<FavouritesBloc>(context)
        .add(RemoveFromFavouriteEvent(animeId: animeId));
  }

  static void addFavourite(BuildContext context, int id) {
    BlocProvider.of<FavouritesBloc>(context)
        .add(AddToFavouriteEvent(animeId: id));
  }
}
