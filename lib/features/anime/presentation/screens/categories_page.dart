import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/strings/app_strings.dart';
import 'package:my_anime/core/widgets/text_form_field.dart';
import 'package:my_anime/features/anime/presentation/widgets/categories_widgets/categories_grid.dart';

class AnimeCategories extends StatelessWidget {
  const AnimeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.categoriesText),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Search Bar
              AppTextFormField(
                text: 'Search',
                prefixIcon: Icons.search,
                borderRadius: 25,
              ),
              SizedBox(
                height: 35,
              ),
              //Categories
              CategoriesGrid()
            ],
          ),
        ),
      ),
    );
  }
}
