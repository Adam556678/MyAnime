import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:my_anime/core/errors/exceptions.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/core/strings/failure_messages.dart';
import 'package:my_anime/features/comments/data/data_sources/remote_data_source.dart';
import 'package:my_anime/features/comments/data/models/comment_model.dart';
import 'package:my_anime/features/comments/domain/entities/comment.dart';
import 'package:my_anime/features/comments/domain/repositories/comments_repo.dart';
import 'package:my_anime/features/personalization/data/datasources/remote_data_source.dart';

class CommentsRepositoryImpl extends CommentsRepository {
  final RemoteDataSource userDataSource;
  final CommentsRemoteDataSource commentsDataSource;

  final currentUser = FirebaseAuth.instance.currentUser;

  CommentsRepositoryImpl(
      {required this.userDataSource, required this.commentsDataSource});

  @override
  Future<Either<Failure, Unit>> addComment(String text, int animeId) async {
    //get user model
    final user = await userDataSource.getUserDetails(currentUser!.email!);

    //get current time
    DateTime date = DateTime.now();
    String dateTime = DateFormat('MMMM dd, yyyy').format(date);

    //create model for comment
    CommentContentModel comment = CommentContentModel(
        id: '', // initial id
        animeId: animeId,
        text: text,
        dateTime: dateTime,
        edited: false,
        userEmail: user.email);

    try {
      await commentsDataSource.addComment(comment);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure(FailureMessages.failedAddingComment));
    }
  }

  @override
  Future<Either<Failure, Unit>> editComment(Comment comment) {
    // TODO: implement editComment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> removeComment(int id) {
    // TODO: implement removeComment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Comment>>> getAllComments(int animeId) async {
    try {
      List<Comment> comments = await commentsDataSource.getAllComments(animeId);
      return Right(comments);
    } on ServerException {
      return Left(ServerFailure(FailureMessages.serverFailureMessage));
    }
  }
}
