part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

class AddCommentEvent extends CommentEvent {
  final String text;
  final int animeId;

  AddCommentEvent({required this.text, required this.animeId});
}

class GetAllCommentsEvent extends CommentEvent {
  final int animeId;

  GetAllCommentsEvent({required this.animeId});
}
