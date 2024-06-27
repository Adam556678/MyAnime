import 'package:flutter/material.dart';
import 'package:my_anime/core/theme/colors.dart';

class AnimeGenre extends StatelessWidget {
  final String genreName;
  const AnimeGenre({
    super.key,
    required this.genreName,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 30,
        decoration: BoxDecoration(
            color: AppColors.purple, borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: Text(
          genreName,
          style:
              const TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        )),
      ),
    );
  }
}
