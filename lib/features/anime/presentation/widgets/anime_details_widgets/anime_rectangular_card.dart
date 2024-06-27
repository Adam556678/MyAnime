import 'package:flutter/material.dart';
import 'package:my_anime/features/anime/data/models/anime_model.dart';
import 'package:my_anime/features/anime/presentation/screens/anime_details.dart';
import 'package:my_anime/features/anime/presentation/widgets/anime_details_widgets/anime_rating_widget.dart';
import 'package:my_anime/utils/helpers/navigation_helper.dart';

class AnimeRectangularCard extends StatelessWidget {
  const AnimeRectangularCard({
    super.key,
    required this.anime,
  });

  final AnimeModel anime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationHelper.navigateTo(context, AnimeDetails(anime: anime));
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
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16),
          ),
          AnimeRatingWidget(
            rate: anime.score,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
