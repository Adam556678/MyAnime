import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/widgets/loading_indicator.dart';
import 'package:my_anime/features/anime/presentation/cubit/recommendations_cubit/recommendations_cubit.dart';
import 'package:my_anime/features/anime/presentation/widgets/home_widgets/recommendations_listview.dart';

class RecommendationsBuilder extends StatelessWidget {
  const RecommendationsBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationsCubit, RecommendationsState>(
      builder: (context, state) {
        if (state is LoadingRecommendations) {
          return const SizedBox(
              height: AppSizes.listViewHeight, child: LoadingIndicator());
        } else if (state is FetchedRecommendations) {
          return RecommendationsListView(
              recommendations: state.recommendations);
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
