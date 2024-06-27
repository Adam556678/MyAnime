import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_anime/core/theme/colors.dart';
import 'package:my_anime/core/widgets/app_button.dart';
import 'package:my_anime/features/anime/presentation/cubit/random_anime_cubit/random_anime_cubit.dart';

class RandomAnimeButton extends StatelessWidget {
  const RandomAnimeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: 'Generate',
      onPressed: () {
        BlocProvider.of<RandomAnimeCubit>(context).getRandomAnime();
      },
      backgroundColor: AppColors.purple,
      prefixIcon: const Icon(Iconsax.shuffle, color: Colors.white),
    );
  }
}
