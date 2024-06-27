import 'package:dartz/dartz.dart';
import 'package:my_anime/core/errors/exceptions.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/core/strings/failure_messages.dart';
import 'package:my_anime/features/anime/data/data_sources/remote_data_source.dart';
import 'package:my_anime/features/anime/data/models/anime_model.dart';
import 'package:my_anime/features/anime/data/models/recommendations_model.dart';
import 'package:my_anime/features/anime/data/models/top_anime_model.dart';
import 'package:my_anime/features/anime/domain/entities/anime.dart';
import 'package:my_anime/features/anime/domain/repositories/anime_repo.dart';

class AnimeRepoImpl extends AnimeRepository {
  final AnimeRemoteDataSource remoteDataSource;

  AnimeRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Recommendations>> getRecommendations(
      int pageNumber) async {
    try {
      final recommendations =
          await remoteDataSource.getRecommendations(pageNumber);
      return Right(recommendations);
    } on ServerException {
      return Left(ServerFailure(FailureMessages.offlineFailureMessage));
    }
  }

  @override
  Future<Either<Failure, TopAnime>> getTopAnime(int pageNumber) async {
    try {
      final topAnime = await remoteDataSource.getTopAnime(pageNumber);
      return Right(topAnime);
    } on ServerException {
      return Left(ServerFailure(FailureMessages.offlineFailureMessage));
    }
  }

  @override
  Future<Either<Failure, Unit>> addFavouriteAnime(int id) async {
    try {
      await remoteDataSource.addFavourite(id);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure(FailureMessages.offlineFailureMessage));
    }
  }

  @override
  Future<Either<Failure, List<Anime>>> getFavourites() async {
    try {
      List<Anime> favorites = await remoteDataSource.getFavourites();
      return Right(favorites);
    } on ServerException {
      return Left(ServerFailure(FailureMessages.undefinedError));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFavourite(int id) async {
    try {
      await remoteDataSource.removeFavourite(id);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure(FailureMessages.offlineFailureMessage));
    } on ElementNotFoundException {
      return Left(ElementNotFoundFailure());
    }
  }

  @override
  Future<bool> checkIfFavourite(int id) async {
    return await remoteDataSource.checkIfFavourite(id);
  }

  @override
  Future<Either<Failure, AnimeModel>> getAnimeById(int id) async {
    try {
      //get anime details by id
      final anime = await remoteDataSource.getAnimeById(id);
      return Right(anime);

      //on Server Exception return Failure
    } on ServerException {
      return Left(ServerFailure(FailureMessages.offlineFailureMessage));
    }
  }

  @override
  Future<Either<Failure, AnimeModel>> getRandomAnime() async {
    try {
      final anime = await remoteDataSource.getRandomAnime();
      return Right(anime);
    } on ServerException {
      return Left(ServerFailure(FailureMessages.offlineFailureMessage));
    }
  }
}
