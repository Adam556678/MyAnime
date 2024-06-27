import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/core/constants/enums.dart';
import 'package:my_anime/core/strings/app_strings.dart';
import 'package:my_anime/core/styles/text_styles.dart';
import 'package:my_anime/core/theme/colors.dart';
import 'package:my_anime/features/anime/presentation/bloc/favourites_bloc/favourites_bloc.dart';
import 'package:my_anime/features/anime/presentation/cubit/recommendations_cubit/recommendations_cubit.dart';
import 'package:my_anime/features/anime/presentation/cubit/top_anime_cubit/top_anime_cubit.dart';
import 'package:my_anime/features/anime/presentation/screens/anime_grid_screen.dart';
import 'package:my_anime/features/anime/presentation/screens/app_drawer.dart';
import 'package:my_anime/features/anime/presentation/screens/recommendations.dart';
import 'package:my_anime/features/anime/presentation/widgets/anime_builders/favourites_list_builder.dart';
import 'package:my_anime/features/anime/presentation/widgets/recommendations/recommendations_builder.dart';
import 'package:my_anime/features/anime/presentation/widgets/anime_builders/top_anime_list_builder.dart';
import 'package:my_anime/utils/helpers/navigation_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<RecommendationsCubit>(context).getRecommendations(1);
    BlocProvider.of<TopAnimeCubit>(context).getTopAnime(1);
    BlocProvider.of<FavouritesBloc>(context).add(GetFavouritesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          AppStrings.appTitle,
          style: AppTextStyles.homePageTitleTextStyle,
        ),
        actions: [
          DrawerButton(
            style: ButtonStyle(iconSize: MaterialStateProperty.all(30)),
          )
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                AppTitleText(
                  title: 'Recommendations',
                  showButton: true,
                  // onpressed: NavigationHelper.navigateTo(context, screen),
                  onpressed: () => NavigationHelper.navigateTo(
                      context, const RecommendationsScreen()),
                ),
                const RecommendationsBuilder(),
                SizedBox(
                  height: size.height * 0.05,
                ),
                AppTitleText(
                  title: "Top Anime",
                  showButton: true,
                  // onpressed: NavigationHelper.navigateTo(context, screen),
                  onpressed: () => NavigationHelper.navigateTo(context,
                      const AnimeGridScreen(choice: ChoiceEnum.topAnime)),
                ),
                const TopAnimeBuilder(),
                SizedBox(
                  height: size.height * 0.05,
                ),
                AppTitleText(
                  title: 'Favourite shows',
                  showButton: true,
                  onpressed: () => NavigationHelper.navigateTo(context,
                      const AnimeGridScreen(choice: ChoiceEnum.favourites)),
                ),
                const FavouritesListBuilder()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppTitleText extends StatelessWidget {
  final String title;
  final void Function()? onpressed;
  final bool showButton;

  const AppTitleText({
    super.key,
    required this.title,
    this.onpressed,
    this.showButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        showButton
            ? InkWell(
                onTap: onpressed,
                child: const Text(
                  'Show All',
                  style: TextStyle(fontSize: 15, color: AppColors.lightPurple),
                ))
            : Container(),
      ],
    );
  }
}
