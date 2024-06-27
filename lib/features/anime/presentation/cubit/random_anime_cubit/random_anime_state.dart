part of 'random_anime_cubit.dart';

@immutable
sealed class RandomAnimeState {}

final class RandomAnimeInitial extends RandomAnimeState {}

final class LoadingRandomAnime extends RandomAnimeState {}

final class FailedToFetchRandomAnime extends RandomAnimeState {
  final String message;

  FailedToFetchRandomAnime({required this.message});
}

final class RandomAnimeFetched extends RandomAnimeState {
  final AnimeModel randomAnime;

  RandomAnimeFetched({required this.randomAnime});
}
