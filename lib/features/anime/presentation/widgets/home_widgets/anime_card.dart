import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/widgets/anime/app_favorite_button.dart';
import 'package:my_anime/features/anime/presentation/widgets/home_widgets/anime_card_details.dart';

class AnimeCard extends StatelessWidget {
  final String image;
  final int id;
  final String title;
  final double? rate;
  final int? year;
  final void Function()? favouriteOnPressed;
  final Color favouriteColor;
  final double? width;
  final double? imageheight;

  const AnimeCard({
    super.key,
    required this.image,
    required this.title,
    this.rate,
    this.year,
    required this.id,
    this.favouriteOnPressed,
    required this.favouriteColor,
    this.width,
    this.imageheight,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: SizedBox(
        width: width ?? AppSizes.animeImageWidth,
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(children: [
              AnimeImage(
                imageheight: imageheight,
                image: image,
              ),
              Column(
                children: [
                  const Spacer(),
                  AnimeCardDetails(rate: rate, title: title, year: year)
                ],
              )
            ]),
          ),
          //favourite Icon
          Align(
            alignment: Alignment.topRight,
            child: AppFavoriteButton(
              id: id,
              color: favouriteColor,
              onPressed: favouriteOnPressed,
            ),
          ),
        ]),
      ),
    );
  }
}

class AnimeImage extends StatelessWidget {
  final String image;
  final double? imageheight;
  const AnimeImage({
    super.key,
    required this.image,
    this.imageheight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageheight ?? AppSizes.animeImageHeight,
      child: Center(
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
