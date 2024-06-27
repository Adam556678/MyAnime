import 'package:dartz/dartz.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/features/comments/domain/entities/comment.dart';
import 'package:my_anime/features/comments/domain/repositories/comments_repo.dart';

class GetAllCommentsUsecase {
  final CommentsRepository commentsRepository;

  GetAllCommentsUsecase({required this.commentsRepository});

  Future<Either<Failure, List<Comment>>> call(int animeId) async {
    return await commentsRepository.getAllComments(animeId);
  }
}
