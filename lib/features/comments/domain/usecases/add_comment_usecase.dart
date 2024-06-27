import 'package:dartz/dartz.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/features/comments/domain/repositories/comments_repo.dart';

class AddCommentUseCase {
  final CommentsRepository commentsRepository;

  AddCommentUseCase({required this.commentsRepository});

  Future<Either<Failure, Unit>> call(String text, int animeId) async {
    return await commentsRepository.addComment(text, animeId);
  }
}
