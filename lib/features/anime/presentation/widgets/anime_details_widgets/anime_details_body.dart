import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/theme/colors.dart';
import 'package:my_anime/core/widgets/anime_synopsis.dart';
import 'package:my_anime/features/anime/domain/entities/anime.dart';
import 'package:my_anime/features/anime/presentation/widgets/anime_details_widgets/anime_main_details.dart';
import 'package:my_anime/features/comments/presentation/bloc/comment_bloc/comment_bloc.dart';
import 'package:my_anime/features/comments/presentation/widgets/comments_section.dart';
import 'package:my_anime/features/anime/presentation/widgets/anime_details_widgets/details_icon.dart';
import 'package:my_anime/features/anime/presentation/widgets/anime_details_widgets/genres_builder.dart';
import 'package:my_anime/utils/helpers/anime_helper.dart';

class AnimeDetailsBody extends StatefulWidget {
  final Anime anime;
  const AnimeDetailsBody({
    super.key,
    required this.anime,
  });

  @override
  State<AnimeDetailsBody> createState() => _AnimeDetailsBodyState();
}

class _AnimeDetailsBodyState extends State<AnimeDetailsBody> {
  @override
  void initState() {
    BlocProvider.of<CommentBloc>(context)
        .add(GetAllCommentsEvent(animeId: widget.anime.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image , Name and date
            AnimeMainDetails(
              size: size,
              image: widget.anime.images.imageUrl,
              name: widget.anime.title,
              year: widget.anime.year,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),

            //Details Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Rating
                DetailsIcon(
                    icon: Icons.star,
                    color: AppColors.starColor,
                    label: '${widget.anime.score}/10'),

                //Duration
                DetailsIcon(
                    icon: Icons.alarm,
                    label:
                        '${AnimeHelper.getDurationInMinutes(widget.anime.duration)} min'),

                //Episodes
                DetailsIcon(
                    icon: Icons.play_arrow,
                    label:
                        '${widget.anime.episodes != 0 ? widget.anime.episodes : 'Unknown'} episodes'),
              ],
            ),

            SizedBox(
              height: size.height * 0.05,
            ),
            //Anime Description
            Container(
              padding: const EdgeInsets.all(AppSizes.sm),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withOpacity(0.5)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionsHeader(text: 'Synopsis'),
                    const SizedBox(
                      height: AppSizes.sm,
                    ),
                    AppReadMoreText(
                      text: widget.anime.synopsis,
                    ),
                  ]),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const SectionsHeader(text: 'Genres'),
            const SizedBox(height: AppSizes.sm),
            GenresBuilder(genres: widget.anime.genres),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Divider(),
            CommentsSection(
              animeId: widget.anime.id,
            )
          ],
        ),
      ),
    );
  }
}

class SectionsHeader extends StatelessWidget {
  final String text;
  const SectionsHeader({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          const TextStyle(fontWeight: FontWeight.w500, fontSize: AppSizes.md),
    );
  }
}
