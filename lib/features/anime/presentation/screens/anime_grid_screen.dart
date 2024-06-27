import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/enums.dart';
import 'package:my_anime/utils/helpers/anime_helper.dart';

class AnimeGridScreen extends StatelessWidget {
  final ChoiceEnum choice;
  const AnimeGridScreen({super.key, required this.choice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AnimeHelper.getTitle(choice)),
      body: AnimeHelper.getAnimeGrid(choice),
    );
  }
}
