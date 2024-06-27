import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/widgets/error_message_widget.dart';
import 'package:my_anime/core/widgets/loading_indicator.dart';
import 'package:my_anime/core/widgets/text_form_field.dart';
import 'package:my_anime/features/anime/presentation/cubit/recommendations_cubit/recommendations_cubit.dart';
import 'package:my_anime/features/anime/presentation/widgets/recommendations/app_pagination.dart';
import 'package:my_anime/features/anime/presentation/widgets/recommendations/recommendations_grid_widget.dart';

class RecommendationsScreen extends StatefulWidget {
  const RecommendationsScreen({super.key});

  @override
  State<RecommendationsScreen> createState() => _RecommendationsScreenState();
}

class _RecommendationsScreenState extends State<RecommendationsScreen> {
  @override
  void initState() {
    BlocProvider.of<RecommendationsCubit>(context).getRecommendations(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recommended")),
      body: BlocBuilder<RecommendationsCubit, RecommendationsState>(
        builder: (context, state) {
          if (state is LoadingRecommendations) {
            return const LoadingIndicator();
          } else if (state is FailedToFetchRecommendations) {
            return ErrorMessageWidget(errorMessage: state.message);
          } else if (state is FetchedRecommendations) {
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

                    RecommendationsGrid(
                      recommendations: state.recommendations,
                    ),

                    // --Pagination
                    SizedBox(
                      height: 37,
                      child: AppPagination(
                        onpressed: (index) =>
                            BlocProvider.of<RecommendationsCubit>(context)
                                .getRecommendations(index + 1),
                        lastPage: state.lastPage,
                        selectedIndex: state.selectedIndex,
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
      ),
    );
  }
}
