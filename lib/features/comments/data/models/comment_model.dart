import 'package:my_anime/features/comments/domain/entities/comment_content.dart';

class CommentContentModel extends CommentContent {
  CommentContentModel({
    required super.id,
    required super.animeId,
    required super.text,
    required super.dateTime,
    required super.edited,
    required super.userEmail,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'animeId': animeId,
        'text': text,
        'dateTime': dateTime,
        'edited': edited,
        'userEmail': userEmail
      };

  factory CommentContentModel.fromJson(Map<String, dynamic> json) =>
      CommentContentModel(
        id: json['id'],
        animeId: json['animeId'],
        text: json['text'],
        dateTime: json['dateTime'],
        edited: json['edited'],
        userEmail: json['userEmail'],
      );
}
