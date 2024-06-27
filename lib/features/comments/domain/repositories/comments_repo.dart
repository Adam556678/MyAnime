import 'package:dartz/dartz.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/features/comments/domain/entities/comment.dart';

abstract class CommentsRepository {
  Future<Either<Failure, Unit>> addComment(String text, int animeId);
  Future<Either<Failure, Unit>> removeComment(int id);
  Future<Either<Failure, Unit>> editComment(Comment comment);
  Future<Either<Failure, List<Comment>>> getAllComments(int animeId);
}
