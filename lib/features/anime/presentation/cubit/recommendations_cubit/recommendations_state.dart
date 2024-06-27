part of 'recommendations_cubit.dart';

@immutable
sealed class RecommendationsState {}

final class RecommendationsInitial extends RecommendationsState {}

final class LoadingRecommendations extends RecommendationsState {}

final class FetchedRecommendations extends RecommendationsState {
  final List<RecommendedAnime> recommendations;
  final int lastPage;
  final int selectedIndex;
  FetchedRecommendations(
      {required this.selectedIndex,
      required this.lastPage,
      required this.recommendations});
}

final class FailedToFetchRecommendations extends RecommendationsState {
  final String message;

  FailedToFetchRecommendations({required this.message});
}
