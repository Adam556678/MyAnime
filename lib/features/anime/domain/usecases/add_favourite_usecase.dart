import 'package:dartz/dartz.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/features/anime/domain/repositories/anime_repo.dart';

class AddFavouriteUsecase {
  final AnimeRepository repository;

  AddFavouriteUsecase({required this.repository});

  Future<Either<Failure, Unit>> call(int id) {
    return repository.addFavouriteAnime(id);
  }
}
