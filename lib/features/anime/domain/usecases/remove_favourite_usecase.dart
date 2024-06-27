import 'package:dartz/dartz.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/features/anime/domain/repositories/anime_repo.dart';

class RemoveFavouriteUseCase {
  final AnimeRepository repository;

  RemoveFavouriteUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(int id) async {
    return await repository.removeFavourite(id);
  }
}
