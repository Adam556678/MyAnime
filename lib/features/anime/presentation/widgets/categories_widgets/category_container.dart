import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/utils/helpers/categories_helper.dart';
import 'package:my_anime/core/styles/shadows.dart';
import 'package:my_anime/core/styles/text_styles.dart';

class CategoryContainer extends StatelessWidget {
  final int index;
  const CategoryContainer({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.sm),
      decoration: BoxDecoration(
          color: CategoriesHelper.getContainerColor(index),
          borderRadius: BorderRadius.circular(5),
          boxShadow: AppShadows.categoriesContainerShadow),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Action",
          style: AppTextStyles.categoryName,
        ),
        const SizedBox(
          height: AppSizes.sm,
        ),
        const Text(
          "+500",
          style: AppTextStyles.categoryCount,
        )
      ]),
    );
  }
}
