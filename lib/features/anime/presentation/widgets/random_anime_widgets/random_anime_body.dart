import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/widgets/transparent_appbar.dart';
import 'package:my_anime/features/anime/presentation/widgets/random_anime_widgets/random_anime_button.dart';
import 'package:my_anime/features/anime/presentation/widgets/random_anime_widgets/random_anime_card.dart';

class RandomAnimeBody extends StatelessWidget {
  const RandomAnimeBody({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SafeArea(
            child: TransparentAppBar(
          title: "Random Anime",
          color: Colors.white,
        )),
        SizedBox(height: size.height * 0.25),
        RandomAnimeCard(size: size),
        const SizedBox(height: AppSizes.sm),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.only(bottom: 35.0),
          child: RandomAnimeButton(),
        )
      ],
    );
  }
}
