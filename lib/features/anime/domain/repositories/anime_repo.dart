import 'package:dartz/dartz.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/features/anime/data/models/anime_model.dart';
import 'package:my_anime/features/anime/data/models/recommendations_model.dart';
import 'package:my_anime/features/anime/data/models/top_anime_model.dart';
import 'package:my_anime/features/anime/domain/entities/anime.dart';

abstract class AnimeRepository {
  Future<Either<Failure, Recommendations>> getRecommendations(int pageNumber);
  Future<Either<Failure, TopAnime>> getTopAnime(int pageNumber);
  Future<Either<Failure, Unit>> addFavouriteAnime(int id);
  Future<Either<Failure, Unit>> removeFavourite(int id);
  Future<Either<Failure, List<Anime>>> getFavourites();
  Future<Either<Failure, AnimeModel>> getAnimeById(int id);
  Future<Either<Failure, AnimeModel>> getRandomAnime();
  Future<bool> checkIfFavourite(int id);
}
