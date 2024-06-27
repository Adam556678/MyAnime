import 'package:dartz/dartz.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/features/anime/domain/entities/anime.dart';
import 'package:my_anime/features/anime/domain/repositories/anime_repo.dart';

class GetAllFavouritesUsecase {
  final AnimeRepository animeRepository;

  GetAllFavouritesUsecase({required this.animeRepository});

  Future<Either<Failure, List<Anime>>> call() async {
    return await animeRepository.getFavourites();
  }
}
