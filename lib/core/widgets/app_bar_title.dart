import 'package:flutter/material.dart';
import 'package:my_anime/core/strings/app_strings.dart';
import 'package:my_anime/core/styles/text_styles.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      AppStrings.appTitle,
      style: AppTextStyles.homePageTitleTextStyle,
    );
  }
}
