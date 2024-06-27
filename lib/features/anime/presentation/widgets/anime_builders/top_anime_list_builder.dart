import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/widgets/loading_indicator.dart';
import 'package:my_anime/features/anime/presentation/cubit/top_anime_cubit/top_anime_cubit.dart';
import 'package:my_anime/features/anime/presentation/widgets/home_widgets/anime_listview.dart';

class TopAnimeBuilder extends StatelessWidget {
  const TopAnimeBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopAnimeCubit, TopAnimeState>(builder: (context, state) {
      if (state is LoadingTopAnime) {
        return const SizedBox(
          height: AppSizes.listViewHeight,
          child: LoadingIndicator(),
        );
      } else if (state is FetchedTopAnime) {
        return AnimeListView(animeList: state.topAnime.data);
      } else if (state is FailureTopAnime) {
        return SizedBox(
          height: AppSizes.listViewHeight,
          child: Center(
            child: Text(state.message),
          ),
        );
      } else {
        return const LoadingIndicator();
      }
    });
  }
}
