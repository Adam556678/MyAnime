part of 'top_anime_cubit.dart';

@immutable
sealed class TopAnimeState {}

final class TopAnimeInitial extends TopAnimeState {}

final class LoadingTopAnime extends TopAnimeState {}

final class FetchedTopAnime extends TopAnimeState {
  final TopAnime topAnime;

  FetchedTopAnime({required this.topAnime});
}

final class FailureTopAnime extends TopAnimeState {
  final String message;

  FailureTopAnime({required this.message});
}
