part of 'favourites_bloc.dart';

@immutable
sealed class FavouritesEvent {}

class AddToFavouriteEvent extends FavouritesEvent {
  final int animeId;

  AddToFavouriteEvent({required this.animeId});
}

class RemoveFromFavouriteEvent extends FavouritesEvent {
  final int animeId;

  RemoveFromFavouriteEvent({required this.animeId});
}

class GetFavouritesEvent extends FavouritesEvent {}
