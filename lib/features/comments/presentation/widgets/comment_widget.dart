import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/widgets/anime_synopsis.dart';
import 'package:my_anime/core/widgets/user_image.dart';
import 'package:my_anime/features/comments/domain/entities/comment.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;
  const CommentWidget({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserImage(size: 45, networkImage: comment.user.userPhoto),
        const SizedBox(
          width: AppSizes.sm,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${comment.user.firstName} ${comment.user.lastName}',
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              const SizedBox(height: AppSizes.sm),
              AppReadMoreText(
                text: comment.commentContent.text,
              ),
              const SizedBox(
                height: AppSizes.sm,
              ),

              //Likes and replies
              const CommentLikesAndReplies(),
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
      ],
    );
  }
}

class CommentLikesAndReplies extends StatelessWidget {
  const CommentLikesAndReplies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.thumb_up_outlined,
            size: 22,
          ),
        ),
        const Text('0'),
        const SizedBox(width: AppSizes.sm),
        IconButton(onPressed: () {}, icon: const Icon(Icons.comment)),
        const Text('0'),
      ],
    );
  }
}
