part of 'comment_bloc.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}

final class Succeed extends CommentState {}

final class Failed extends CommentState {
  final String message;

  Failed({required this.message});
}

final class Loading extends CommentState {}

final class CommentsRetrieved extends CommentState {
  final List<Comment> comments;

  CommentsRetrieved({required this.comments});
}
