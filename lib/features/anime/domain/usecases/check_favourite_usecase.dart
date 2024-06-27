import 'package:my_anime/features/anime/domain/repositories/anime_repo.dart';

class CheckIfFavouriteUsecase {
  final AnimeRepository repository;

  CheckIfFavouriteUsecase({required this.repository});

  Future<bool> call(int id) async {
    return await repository.checkIfFavourite(id);
  }
}
