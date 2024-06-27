import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/widgets/error_message_widget.dart';
import 'package:my_anime/core/widgets/loading_indicator.dart';
import 'package:my_anime/core/widgets/text_form_field.dart';
import 'package:my_anime/features/anime/presentation/cubit/top_anime_cubit/top_anime_cubit.dart';
import 'package:my_anime/features/anime/presentation/widgets/anime_builders/anime_grid.dart';
import 'package:my_anime/features/anime/presentation/widgets/recommendations/app_pagination.dart';

class TopAnimeGridBuilder extends StatefulWidget {
  const TopAnimeGridBuilder({super.key});

  @override
  State<TopAnimeGridBuilder> createState() => _TopAnimeGridBuilderState();
}

class _TopAnimeGridBuilderState extends State<TopAnimeGridBuilder> {
  @override
  void initState() {
    BlocProvider.of<TopAnimeCubit>(context).getTopAnime(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopAnimeCubit, TopAnimeState>(
      builder: (context, state) {
        if (state is LoadingTopAnime) {
          return const LoadingIndicator();
        } else if (state is FailureTopAnime) {
          return ErrorMessageWidget(errorMessage: state.message);
        } else if (state is FetchedTopAnime) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.defaultPadding),
              child: Column(
                children: [
                  // --Search
                  const AppTextFormField(
                    text: 'Search',
                    prefixIcon: Icons.search,
                    borderRadius: 25,
                  ),
                  const SizedBox(height: AppSizes.large),

                  AnimeGrid(animeList: state.topAnime.data),

                  // --Pagination
                  SizedBox(
                    height: 37,
                    child: AppPagination(
                      onpressed: (indx) =>
                          BlocProvider.of<TopAnimeCubit>(context)
                              .getTopAnime(indx + 1),
                      lastPage: state.topAnime.pagination.lastVisiblePage,
                      selectedIndex: state.topAnime.pagination.currentPage - 1,
                    ),
                  ),
                  const SizedBox(height: AppSizes.md)
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
