part of 'favourites_bloc.dart';

@immutable
sealed class FavouritesState {}

final class FavouritesInitial extends FavouritesState {}

final class FavouritesFetched extends FavouritesState {
  final List<Anime> favorites;

  FavouritesFetched({required this.favorites});
}

final class FavouritesLoading extends FavouritesState {}

final class FavouritesFailed extends FavouritesState {
  final String message;

  FavouritesFailed({required this.message});
}
