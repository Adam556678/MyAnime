import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/features/anime/data/models/anime_model.dart';
import 'package:my_anime/features/anime/domain/usecases/get_anime_by_id_usecase.dart';

part 'anime_details_state.dart';

class AnimeDetailsCubit extends Cubit<AnimeDetailsState> {
  final GetAnimeByIdUsecase getAnimeByIdUsecase;
  AnimeDetailsCubit({required this.getAnimeByIdUsecase})
      : super(AnimeDetailsInitial());

  Future<void> getAnimeDetails(int id) async {
    //emit loading
    emit(LoadingAnimeDetails());

    //get anime details or failure
    final animeDetails = await getAnimeByIdUsecase(id);

    //emit state based on data
    emit(getAnimeDetailsState(animeDetails));
  }

  AnimeDetailsState getAnimeDetailsState(
          Either<Failure, AnimeModel> animeDetails) =>
      animeDetails.fold(
          (failure) => FailedToFetch(message: failure.message ?? ''),
          (anime) => FetchedSuccessfully(anime: anime));
}
