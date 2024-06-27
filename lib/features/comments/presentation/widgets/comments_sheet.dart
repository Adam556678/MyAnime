import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/widgets/loading_indicator.dart';
import 'package:my_anime/core/widgets/text_form_field.dart';
import 'package:my_anime/features/comments/domain/entities/comment.dart';
import 'package:my_anime/features/comments/domain/entities/comment_content.dart';
import 'package:my_anime/features/comments/presentation/bloc/comment_bloc/comment_bloc.dart';
import 'package:my_anime/features/comments/presentation/widgets/comment_widget.dart';
import 'package:my_anime/features/comments/presentation/widgets/comments_header.dart';

class CommentsSheet {
  static void showBottomSheet(BuildContext context, int animeId) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) => Sheet(animeId: animeId),
    );
  }
}

class Sheet extends StatefulWidget {
  final int animeId;
  const Sheet({super.key, required this.animeId});

  @override
  State<Sheet> createState() => _SheetState();
}

class _SheetState extends State<Sheet> {
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      builder: (_, controller) {
        final mediaQuery = MediaQuery.of(context);
        return Padding(
          padding: EdgeInsets.only(
            top: mediaQuery.viewInsets.top,
            bottom: mediaQuery.viewInsets.bottom,
          ),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: AppSizes.md, left: AppSizes.md, right: AppSizes.md),
                child: BlocBuilder<CommentBloc, CommentState>(
                  builder: (context, state) {
                    if (state is Loading) {
                      return const LoadingIndicator();
                    } else if (state is CommentsRetrieved) {
                      List<Comment> commentsList = state.comments;
                      return SingleChildScrollView(
                        controller: controller,
                        child: Column(
                          children: [
                            CommentsHeader(count: commentsList.length),
                            const SizedBox(height: AppSizes.md),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: commentsList.length,
                              itemBuilder: (context, index) =>
                                  CommentWidget(comment: commentsList[index]),
                            ),
                          ],
                        ),
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
              ),

              // -- Comment TextField
              Column(
                children: [
                  const Spacer(),
                  Stack(children: [
                    AppTextFormField(
                      text: 'Write a comment...',
                      controller: commentController,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          if (commentController.text.isNotEmpty) {
                            //trigger comments bloc
                            BlocProvider.of<CommentBloc>(context).add(
                              AddCommentEvent(
                                  text: commentController.text,
                                  animeId: widget.animeId),
                            );

                            //clear textField text
                            commentController.text = '';
                          }
                        },
                        icon: const Icon(
                          Icons.send,
                          size: 27,
                        ),
                      ),
                    )
                  ]),
                ],
              ),
            ]),
          ),
        );
      },
    );
  }
}
