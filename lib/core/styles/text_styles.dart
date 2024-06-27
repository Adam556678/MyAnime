import 'package:flutter/material.dart';
import 'package:my_anime/core/theme/colors.dart';

class AppTextStyles {
  static const TextStyle buttonTextStyle =
      TextStyle(color: Colors.white, fontSize: 16);

  static const TextStyle homePageTitleTextStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w600,
      letterSpacing: 2.5,
      color: Colors.white);

  static const TextStyle userNameTextStyle =
      TextStyle(fontSize: 17, fontWeight: FontWeight.w400);

  static const TextStyle loginAndRegisterTextStyle = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w900,
  );

  static const animeIconDetailsLabelTextStyle =
      TextStyle(fontSize: 17, fontWeight: FontWeight.w500);

  static const appBarTitleTextStyle =
      TextStyle(color: Colors.white, fontSize: 20);

  //ReadMore
  static const moreTextStyle = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.purple);

  static const lessTextStyle = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.purple);

  static const loginRegisterButtonTextStyle =
      TextStyle(color: Colors.white, fontSize: 17);

  //Categories
  static TextStyle categoryName = TextStyle(
      color: Colors.black.withOpacity(0.6),
      fontSize: 20,
      fontWeight: FontWeight.w500);

  static const TextStyle categoryCount =
      TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600);

  static const TextStyle errorMessageTextStyle = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.w400,
  );
}
