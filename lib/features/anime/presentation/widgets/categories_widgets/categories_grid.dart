import 'package:flutter/material.dart';
import 'package:my_anime/features/anime/presentation/widgets/categories_widgets/category_container.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 13.0,
        childAspectRatio: 1 / 1.3,
      ),
      itemCount: 9,
      itemBuilder: (context, index) => CategoryContainer(index: index),
    );
  }
}
