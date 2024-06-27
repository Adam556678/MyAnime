import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/theme/colors.dart';
import 'package:my_anime/core/widgets/loading_indicator.dart';
import 'package:my_anime/features/comments/domain/entities/comment.dart';
import 'package:my_anime/features/comments/presentation/bloc/comment_bloc/comment_bloc.dart';
import 'package:my_anime/features/comments/presentation/widgets/comment_widget.dart';
import 'package:my_anime/features/comments/presentation/widgets/comments_header.dart';
import 'package:my_anime/features/comments/presentation/widgets/comments_sheet.dart';

class CommentsSection extends StatelessWidget {
  final int animeId;
  const CommentsSection({
    super.key,
    required this.animeId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<CommentBloc, CommentState>(
          builder: (context, state) {
            if (state is Loading) {
              return const LoadingIndicator();
            } else if (state is CommentsRetrieved) {
              List<Comment> commentsList = state.comments;
              return Column(
                children: [
                  CommentsHeader(count: commentsList.length),
                  const SizedBox(height: AppSizes.md),
                  commentsList.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (context, index) =>
                              CommentWidget(comment: commentsList[index]),
                        )
                      : const Center(
                          child: Text('No Comments yet..'),
                        ),
                ],
              );
            } else if (state is Failed) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Container();
            }
          },
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<CommentBloc>(context)
                  .add(GetAllCommentsEvent(animeId: animeId));
              CommentsSheet.showBottomSheet(context, animeId);
            },
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.keyboard_arrow_up_outlined,
                  size: 25,
                  color: AppColors.purple,
                ),
                Text(
                  "All comments",
                  style: TextStyle(
                      color: AppColors.purple, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
