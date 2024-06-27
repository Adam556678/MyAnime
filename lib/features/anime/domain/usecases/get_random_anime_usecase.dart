import 'package:dartz/dartz.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/features/anime/data/models/anime_model.dart';
import 'package:my_anime/features/anime/domain/repositories/anime_repo.dart';

class GetRandomAnimeUsecase {
  final AnimeRepository repository;

  GetRandomAnimeUsecase({required this.repository});

  Future<Either<Failure, AnimeModel>> call() async {
    return await repository.getRandomAnime();
  }
}
