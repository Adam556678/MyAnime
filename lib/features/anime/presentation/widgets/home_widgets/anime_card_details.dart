import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/features/anime/presentation/widgets/anime_details_widgets/anime_rating_widget.dart';

class AnimeCardDetails extends StatelessWidget {
  final String title;
  final double? rate;
  final int? year;
  const AnimeCardDetails({
    super.key,
    required this.title,
    this.rate,
    this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: AppSizes.animeCardDetailsContainerHeight,
        color: Colors.black.withOpacity(0.6),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 90,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                const Spacer(),
                AnimeRatingWidget(
                  rate: rate,
                )
              ],
            ),
            year != null
                ? Text(
                    year != 0 ? '$year' : 'unknown',
                    style: const TextStyle(color: Colors.white),
                  )
                : Container()
          ],
        ),
      ),
      const SizedBox(
        height: 3,
      ),
    ]);
  }
}
