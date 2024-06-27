import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/core/strings/failure_messages.dart';
import 'package:my_anime/features/anime/domain/entities/anime.dart';
import 'package:my_anime/features/anime/domain/usecases/add_favourite_usecase.dart';
import 'package:my_anime/features/anime/domain/usecases/get_all_favourites_usecase.dart';
import 'package:my_anime/features/anime/domain/usecases/remove_favourite_usecase.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  // usecases
  final AddFavouriteUsecase addFavouriteUsecase;
  final RemoveFavouriteUseCase removeFavouriteUseCase;
  final GetAllFavouritesUsecase getAllFavouritesUsecase;

  FavouritesBloc(
      {required this.getAllFavouritesUsecase,
      required this.removeFavouriteUseCase,
      required this.addFavouriteUsecase})
      : super(FavouritesInitial()) {
    on<FavouritesEvent>((event, emit) async {
      if (event is AddToFavouriteEvent) {
        final response = await addFavouriteUsecase(event.animeId);
        FavouritesState addFavState = await getAddFavouriteState(response);
        emit(addFavState);
        // if event is remove from favourites
      } else if (event is GetFavouritesEvent) {
        final response = await getAllFavouritesUsecase();
        //emit get favourites state
        emit(getFavouritesState(response));
      } else if (event is RemoveFromFavouriteEvent) {
        //get response from repository
        final response = await removeFavouriteUseCase(event.animeId);
        //get the state
        FavouritesState removeFavState =
            await getRemoveFromFavouritesStates(response);
        //emit state
        emit(removeFavState);
      }
    });
  }

  FavouritesState getFavouritesState(Either<Failure, List<Anime>> response) =>
      response.fold(
        (failure) =>
            FavouritesFailed(message: FailureMessages.failedTofetchFavourites),
        (favorites) => FavouritesFetched(favorites: favorites),
      );
  Future<FavouritesState> getAddFavouriteState(
      Either<Failure, Unit> response) async {
    return response.fold(
        (failure) => FavouritesFailed(
            message: failure.message ?? FailureMessages.undefinedError),
        (_) async {
      final favorites = await getAllFavouritesUsecase();
      FavouritesState favState = getFavouritesState(favorites);
      return favState;
    });
  }

  Future<FavouritesState> getRemoveFromFavouritesStates(
      Either<Failure, Unit> response) async {
    return response.fold(
        (failure) => FavouritesFailed(
            message: failure.message ?? FailureMessages.undefinedError),
        (_) async {
      final favorites = await getAllFavouritesUsecase();
      FavouritesState favState = getFavouritesState(favorites);
      return favState;
    });
  }
}
