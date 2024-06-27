import 'package:my_anime/features/comments/domain/entities/comment_content.dart';
import 'package:my_anime/features/personalization/domain/entities/user.dart';

class Comment {
  final CommentContent commentContent;
  final UserEntity user;

  Comment({
    required this.commentContent,
    required this.user,
  });
}
