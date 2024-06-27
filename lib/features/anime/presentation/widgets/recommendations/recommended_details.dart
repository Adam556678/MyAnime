import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/core/widgets/error_message_widget.dart';
import 'package:my_anime/core/widgets/loading_indicator.dart';
import 'package:my_anime/features/anime/presentation/cubit/anime_details_cubit/anime_details_cubit.dart';
import 'package:my_anime/features/anime/presentation/screens/anime_details.dart';

class RecommendedDetailsScreen extends StatelessWidget {
  const RecommendedDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeDetailsCubit, AnimeDetailsState>(
      builder: (context, state) {
        if (state is LoadingAnimeDetails) {
          return const Scaffold(body: LoadingIndicator());
        } else if (state is FailedToFetch) {
          return Scaffold(
              body: ErrorMessageWidget(errorMessage: state.message));
        } else if (state is FetchedSuccessfully) {
          return AnimeDetails(anime: state.anime);
        } else {
          return const Scaffold(body: LoadingIndicator());
        }
      },
    );
  }
}
