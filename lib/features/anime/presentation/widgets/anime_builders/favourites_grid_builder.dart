import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/widgets/error_message_widget.dart';
import 'package:my_anime/core/widgets/loading_indicator.dart';
import 'package:my_anime/features/anime/data/models/anime_model.dart';
import 'package:my_anime/features/anime/presentation/bloc/favourites_bloc/favourites_bloc.dart';
import 'package:my_anime/features/anime/presentation/widgets/anime_builders/anime_grid.dart';

class FavouritesGridBuilder extends StatelessWidget {
  const FavouritesGridBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesBloc, FavouritesState>(
      builder: (context, state) {
        if (state is FavouritesLoading) {
          return const Center(
            child: LoadingIndicator(),
          );
        } else if (state is FavouritesFailed) {
          return ErrorMessageWidget(errorMessage: state.message);
        } else if (state is FavouritesFetched) {
          print("Favourites fetched state -------------");
          return Padding(
            padding: const EdgeInsets.all(AppSizes.defaultPadding),
            child: AnimeGrid(animeList: state.favorites as List<AnimeModel>),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
