import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/widgets/loading_indicator.dart';
import 'package:my_anime/features/anime/data/models/anime_model.dart';
import 'package:my_anime/features/anime/presentation/bloc/favourites_bloc/favourites_bloc.dart';
import 'package:my_anime/features/anime/presentation/widgets/home_widgets/anime_listview.dart';

class FavouritesListBuilder extends StatelessWidget {
  const FavouritesListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesBloc, FavouritesState>(
      builder: (context, state) {
        if (state is FavouritesLoading) {
          return const SizedBox(
            height: AppSizes.listViewHeight,
            child: LoadingIndicator(),
          );
        } else if (state is FavouritesFailed) {
          return SizedBox(
            height: AppSizes.listViewHeight,
            child: Center(
              child: Text(state.message),
            ),
          );
        } else if (state is FavouritesFetched) {
          if (state.favorites.isEmpty) {
            return const EmptyFavouritesWidget();
          }
          return AnimeListView(animeList: state.favorites as List<AnimeModel>);
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}

class EmptyFavouritesWidget extends StatelessWidget {
  const EmptyFavouritesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.listViewHeight,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.heart_slash,
              size: MediaQuery.of(context).size.width * 0.15,
            ),
            const SizedBox(height: AppSizes.sm),
            const SizedBox(
                child: Text(
              "There's no Favourite shows yet, try to add some!",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ))
          ],
        ),
      ),
    );
  }
}
