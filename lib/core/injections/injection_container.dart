import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:my_anime/features/anime/data/data_sources/remote_data_source.dart';
import 'package:my_anime/features/anime/data/repositories/anime_repo_implementation.dart';
import 'package:my_anime/features/anime/domain/repositories/anime_repo.dart';
import 'package:my_anime/features/anime/domain/usecases/add_favourite_usecase.dart';
import 'package:my_anime/features/anime/domain/usecases/check_favourite_usecase.dart';
import 'package:my_anime/features/anime/domain/usecases/get_all_favourites_usecase.dart';
import 'package:my_anime/features/anime/domain/usecases/get_anime_by_id_usecase.dart';
import 'package:my_anime/features/anime/domain/usecases/get_random_anime_usecase.dart';
import 'package:my_anime/features/anime/domain/usecases/get_recommendations_usecase.dart';
import 'package:my_anime/features/anime/domain/usecases/get_top_anime_usecase.dart';
import 'package:my_anime/features/anime/domain/usecases/remove_favourite_usecase.dart';
import 'package:my_anime/features/anime/presentation/bloc/favourites_bloc/favourites_bloc.dart';
import 'package:my_anime/features/anime/presentation/cubit/anime_details_cubit/anime_details_cubit.dart';
import 'package:my_anime/features/anime/presentation/cubit/random_anime_cubit/random_anime_cubit.dart';
import 'package:my_anime/features/anime/presentation/cubit/recommendations_cubit/recommendations_cubit.dart';
import 'package:my_anime/features/anime/presentation/cubit/top_anime_cubit/top_anime_cubit.dart';
import 'package:my_anime/features/comments/data/data_sources/remote_data_source.dart';
import 'package:my_anime/features/comments/data/repositories/comments_repo_impl.dart';
import 'package:my_anime/features/comments/domain/repositories/comments_repo.dart';
import 'package:my_anime/features/comments/domain/usecases/add_comment_usecase.dart';
import 'package:my_anime/features/comments/domain/usecases/get_all_comments_usecase.dart';
import 'package:my_anime/features/comments/presentation/bloc/comment_bloc/comment_bloc.dart';
import 'package:my_anime/features/personalization/data/datasources/remote_data_source.dart';
import 'package:my_anime/features/personalization/data/repositories/user_repository_impl.dart';
import 'package:my_anime/features/personalization/domain/repositories/user_repository.dart';
import 'package:my_anime/features/personalization/domain/usecases/add_user_usecase.dart';
import 'package:my_anime/features/personalization/domain/usecases/get_user_details_usecase.dart';
import 'package:my_anime/features/personalization/domain/usecases/update_user_usecase.dart';
import 'package:my_anime/features/personalization/presentation/blocs/user_operations_bloc/user_operations_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //Blocs
  getIt.registerFactory(
    () => UserOperationsBloc(
      getUserDetailsUsecase: getIt(),
      addUserUsecase: getIt(),
      updateUserUsecase: getIt(),
    ),
  );
  getIt.registerFactory(
      () => RecommendationsCubit(recommendationsUseCase: getIt()));

  getIt.registerFactory(() => TopAnimeCubit(getTopAnimeUsecase: getIt()));

  getIt.registerFactory(() => FavouritesBloc(
      getAllFavouritesUsecase: getIt(),
      removeFavouriteUseCase: getIt(),
      addFavouriteUsecase: getIt()));

  getIt.registerFactory(() => AnimeDetailsCubit(getAnimeByIdUsecase: getIt()));

  getIt.registerFactory(() => RandomAnimeCubit(randomAnimeUsecase: getIt()));

  getIt.registerFactory(() =>
      CommentBloc(addCommentUseCase: getIt(), getAllCommentsUsecase: getIt()));

  // Usecases
  getIt.registerLazySingleton(() => AddUserUsecase(userRepository: getIt()));
  getIt.registerLazySingleton(() => UpdateUserUsecase(repository: getIt()));
  getIt.registerLazySingleton(
      () => GetUserDetailsUseCase(userRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetRecommendationsUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => GetTopAnimeUsecase(repo: getIt()));
  getIt
      .registerLazySingleton(() => RemoveFavouriteUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => AddFavouriteUsecase(repository: getIt()));
  getIt.registerLazySingleton(
      () => CheckIfFavouriteUsecase(repository: getIt()));
  getIt.registerLazySingleton(
      () => GetAnimeByIdUsecase(animeRepository: getIt()));

  getIt.registerLazySingleton(() => GetRandomAnimeUsecase(repository: getIt()));

  getIt.registerLazySingleton(
      () => AddCommentUseCase(commentsRepository: getIt()));

  getIt.registerLazySingleton(
      () => GetAllCommentsUsecase(commentsRepository: getIt()));

  getIt.registerLazySingleton(
      () => GetAllFavouritesUsecase(animeRepository: getIt()));

  //Repository
  getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: getIt()));
  getIt.registerLazySingleton<AnimeRepository>(
      () => AnimeRepoImpl(remoteDataSource: getIt()));

  getIt.registerLazySingleton<CommentsRepository>(() => CommentsRepositoryImpl(
      userDataSource: getIt(), commentsDataSource: getIt()));

  // Data Sources
  getIt.registerLazySingleton<CommentsRemoteDataSource>(
      () => CommentsRemoteDataSourceImpl(usersDataSource: getIt()));

  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  getIt.registerLazySingleton<AnimeRemoteDataSource>(() =>
      AnimeRemoteDataSourceImpl(
          client: getIt(), firebaseAuth: getIt(), firestore: getIt()));

  //Firebase
  getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Clients
  getIt.registerLazySingleton(() => Client());
}
