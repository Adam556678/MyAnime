import 'package:dartz/dartz.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/features/anime/data/models/anime_model.dart';
import 'package:my_anime/features/anime/domain/repositories/anime_repo.dart';

class GetAnimeByIdUsecase {
  final AnimeRepository animeRepository;

  GetAnimeByIdUsecase({required this.animeRepository});

  Future<Either<Failure, AnimeModel>> call(int id) async {
    return await animeRepository.getAnimeById(id);
  }
}
