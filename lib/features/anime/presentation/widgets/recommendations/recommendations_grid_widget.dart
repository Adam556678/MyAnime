import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/features/anime/data/models/recommendations_model.dart';
import 'package:my_anime/features/anime/presentation/cubit/anime_details_cubit/anime_details_cubit.dart';
import 'package:my_anime/features/anime/presentation/widgets/recommendations/recommended_details.dart';
import 'package:my_anime/utils/helpers/navigation_helper.dart';

class RecommendationsGrid extends StatelessWidget {
  final List<RecommendedAnime> recommendations;
  const RecommendationsGrid({super.key, required this.recommendations});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 17.0,
        crossAxisSpacing: 5.0,
        childAspectRatio: 1 / 1.8,
      ),
      itemCount: recommendations.length,
      itemBuilder: (context, index) {
        final anime = recommendations[index];
        return RecommendationsCard(anime: anime);
      },
    );
  }
}

class RecommendationsCard extends StatelessWidget {
  const RecommendationsCard({
    super.key,
    required this.anime,
  });

  final RecommendedAnime anime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<AnimeDetailsCubit>(context).getAnimeDetails(anime.id);
        NavigationHelper.navigateTo(context, const RecommendedDetailsScreen());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Image.network(
              anime.images.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            anime.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
