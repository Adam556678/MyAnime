import 'package:flutter/material.dart';
import 'package:my_anime/core/strings/app_strings.dart';
import 'package:my_anime/core/styles/text_styles.dart';
import 'package:readmore/readmore.dart';

class AppReadMoreText extends StatelessWidget {
  final String text;
  const AppReadMoreText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ReadMoreText(
        text,
        trimLines: 3,
        trimMode: TrimMode.Line,
        trimCollapsedText: AppStrings.showMoreText,
        trimExpandedText: AppStrings.showLessText,
        moreStyle: AppTextStyles.moreTextStyle,
        lessStyle: AppTextStyles.lessTextStyle,
      ),
    ]);
  }
}
