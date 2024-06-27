import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/core/strings/app_strings.dart';
import 'package:my_anime/core/theme/app_themes.dart';
import 'package:my_anime/core/injections/injection_container.dart' as di;
import 'package:my_anime/features/anime/presentation/bloc/favourites_bloc/favourites_bloc.dart';
import 'package:my_anime/features/anime/presentation/cubit/anime_details_cubit/anime_details_cubit.dart';
import 'package:my_anime/features/anime/presentation/cubit/random_anime_cubit/random_anime_cubit.dart';
import 'package:my_anime/features/anime/presentation/cubit/recommendations_cubit/recommendations_cubit.dart';
import 'package:my_anime/features/anime/presentation/cubit/top_anime_cubit/top_anime_cubit.dart';
import 'package:my_anime/features/anime/presentation/screens/onboarding_screen.dart';
import 'package:my_anime/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:my_anime/features/auth/presentation/cubits/register_cubit/cubit/register_cubit.dart';
import 'package:my_anime/features/comments/presentation/bloc/comment_bloc/comment_bloc.dart';
import 'package:my_anime/features/personalization/presentation/blocs/user_operations_bloc/user_operations_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyAnime());
}

class MyAnime extends StatelessWidget {
  const MyAnime({super.key});
  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(AppStrings.loginImage), context);
    precacheImage(const AssetImage(AppStrings.registerImage), context);
    precacheImage(
        const AssetImage('assets/images/onboard_screen/onboard_image1.jpg'),
        context);
    precacheImage(
        const AssetImage('assets/images/onboard_screen/onboard_image2.jpg'),
        context);
    precacheImage(
        const AssetImage('assets/images/onboard_screen/onboard_image3.jpg'),
        context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<RegisterCubit>(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => di.getIt<UserOperationsBloc>()),
        BlocProvider(create: (context) => di.getIt<RecommendationsCubit>()),
        BlocProvider(create: (context) => di.getIt<TopAnimeCubit>()),
        BlocProvider(create: (context) => di.getIt<FavouritesBloc>()),
        BlocProvider(create: (context) => di.getIt<AnimeDetailsCubit>()),
        BlocProvider(create: (context) => di.getIt<RandomAnimeCubit>()),
        BlocProvider(create: (context) => di.getIt<CommentBloc>()),
      ],
      child: MaterialApp(
        theme: ThemeData(appBarTheme: AppThemes.appBarTheme),
        debugShowCheckedModeBanner: false,
        // home: const SplashScreen(),
        home: const OnBoardingScreen(),
      ),
    );
  }
}
