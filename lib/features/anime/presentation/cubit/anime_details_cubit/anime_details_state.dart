part of 'anime_details_cubit.dart';

@immutable
sealed class AnimeDetailsState {}

final class AnimeDetailsInitial extends AnimeDetailsState {}

final class LoadingAnimeDetails extends AnimeDetailsState {}

final class FetchedSuccessfully extends AnimeDetailsState {
  final AnimeModel anime;

  FetchedSuccessfully({required this.anime});
}

final class FailedToFetch extends AnimeDetailsState {
  final String message;

  FailedToFetch({required this.message});
}
