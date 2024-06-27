import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/sizes.dart';

class AnimeMainDetails extends StatelessWidget {
  final String image;
  final String name;
  final int? year;
  const AnimeMainDetails({
    super.key,
    required this.size,
    required this.image,
    required this.name,
    this.year,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //anime Image
        SizedBox(
          width: size.width * 0.4,
          height: size.height * 0.23,
          child: Image.network(
            image,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          width: size.width * 0.05,
        ),
        // Anime Main Details
        Column(
          children: [
            // Anime Title
            SizedBox(
              width: size.width * 0.4,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                softWrap: true,
                overflow: TextOverflow.clip,
              ),
            ),
            const SizedBox(height: AppSizes.sm),
            // Anime Date
            year != 0 ? Text("${year ?? 'Unknown'}") : const Text("Unknown"),
          ],
        )
      ],
    );
  }
}
