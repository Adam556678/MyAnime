import 'package:flutter/material.dart';
import 'package:my_anime/core/widgets/curved_background.dart';
import 'package:my_anime/features/anime/presentation/widgets/random_anime_widgets/random_anime_body.dart';

class RandomAnimeScreen extends StatelessWidget {
  const RandomAnimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        //Background
        const CurvedBackground(),

        //AppBar
        RandomAnimeBody(size: size),
      ],
    ));
  }
}
