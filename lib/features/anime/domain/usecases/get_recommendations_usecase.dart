import 'package:dartz/dartz.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/features/anime/data/models/recommendations_model.dart';
import 'package:my_anime/features/anime/domain/repositories/anime_repo.dart';

class GetRecommendationsUseCase {
  final AnimeRepository repository;

  GetRecommendationsUseCase({required this.repository});

  Future<Either<Failure, Recommendations>> call(int pageNumber) async {
    return await repository.getRecommendations(pageNumber);
  }
}
