import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/core/strings/failure_messages.dart';
import 'package:my_anime/features/anime/data/models/recommendations_model.dart';
import 'package:my_anime/features/anime/domain/usecases/get_recommendations_usecase.dart';

part 'recommendations_state.dart';

class RecommendationsCubit extends Cubit<RecommendationsState> {
  RecommendationsCubit({required this.recommendationsUseCase})
      : super(RecommendationsInitial());

  final GetRecommendationsUseCase recommendationsUseCase;

  Future<void> getRecommendations(int page) async {
    emit(LoadingRecommendations());

    final recommendationsResponse = await recommendationsUseCase(page);
    emit(getRecommendationsState(recommendationsResponse, page - 1));
  }

  RecommendationsState getRecommendationsState(
      Either<Failure, Recommendations> recommendationsResponse,
      int selectedIndex) {
    return recommendationsResponse.fold(
        (failure) => FailedToFetchRecommendations(
            message: FailureMessages.serverFailureMessage),
        (recommendations) => FetchedRecommendations(
            selectedIndex: selectedIndex,
            recommendations: recommendations.data,
            lastPage: recommendations.lastPage));
  }
}
