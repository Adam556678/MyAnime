import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/core/strings/failure_messages.dart';
import 'package:my_anime/features/anime/data/models/top_anime_model.dart';
import 'package:my_anime/features/anime/domain/usecases/get_top_anime_usecase.dart';

part 'top_anime_state.dart';

class TopAnimeCubit extends Cubit<TopAnimeState> {
  TopAnimeCubit({required this.getTopAnimeUsecase}) : super(TopAnimeInitial());

  final GetTopAnimeUsecase getTopAnimeUsecase;

  Future<void> getTopAnime(int pageNumber) async {
    emit(LoadingTopAnime());

    final dataOrFailure = await getTopAnimeUsecase(pageNumber);
    emit(getState(dataOrFailure));
  }

  TopAnimeState getState(Either<Failure, TopAnime> dataOrFailure) {
    return dataOrFailure.fold(
        (failure) =>
            FailureTopAnime(message: FailureMessages.serverFailureMessage),
        (data) => FetchedTopAnime(topAnime: data));
  }
}
