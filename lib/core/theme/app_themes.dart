import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/styles/text_styles.dart';
import 'package:my_anime/core/theme/colors.dart';

class AppThemes {
  static const appBarTheme = AppBarTheme(
    backgroundColor: AppColors.purple,
    elevation: 0.0,
    toolbarHeight: AppSizes.toolbarHeight,
    iconTheme: iconTheme,
    titleTextStyle: AppTextStyles.appBarTitleTextStyle,
  );

  static const iconTheme = IconThemeData(color: Colors.white, size: 25);
}
