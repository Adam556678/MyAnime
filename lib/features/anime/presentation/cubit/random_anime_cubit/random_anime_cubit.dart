import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/core/strings/failure_messages.dart';
import 'package:my_anime/features/anime/data/models/anime_model.dart';
import 'package:my_anime/features/anime/domain/usecases/get_random_anime_usecase.dart';

part 'random_anime_state.dart';

class RandomAnimeCubit extends Cubit<RandomAnimeState> {
  final GetRandomAnimeUsecase randomAnimeUsecase;
  RandomAnimeCubit({required this.randomAnimeUsecase})
      : super(RandomAnimeInitial());

  Future<void> getRandomAnime() async {
    //emit loading state
    emit(LoadingRandomAnime());

    //get the response
    final response = await randomAnimeUsecase();

    //emit state based on the response
    emit(getRandomAnimeStates(response));
  }
}

RandomAnimeState getRandomAnimeStates(Either<Failure, AnimeModel> response) =>
    response.fold(
        (failure) => FailedToFetchRandomAnime(
            message: failure.message ?? FailureMessages.undefinedError),
        (anime) => RandomAnimeFetched(randomAnime: anime));
