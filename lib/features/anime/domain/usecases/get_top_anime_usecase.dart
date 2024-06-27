import 'package:dartz/dartz.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/features/anime/data/models/top_anime_model.dart';
import 'package:my_anime/features/anime/domain/repositories/anime_repo.dart';

class GetTopAnimeUsecase {
  final AnimeRepository repo;

  GetTopAnimeUsecase({required this.repo});

  Future<Either<Failure, TopAnime>> call(int pageNumber) async {
    return await repo.getTopAnime(pageNumber);
  }
}
