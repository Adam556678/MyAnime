class CommentContent {
  String id;
  final int animeId;
  final String text;
  final String dateTime;
  final bool edited;
  final String userEmail;

  CommentContent({
    required this.edited,
    required this.dateTime,
    required this.id,
    required this.animeId,
    required this.text,
    required this.userEmail,
  });
}
