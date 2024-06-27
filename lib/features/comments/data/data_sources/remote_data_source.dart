import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:my_anime/core/errors/exceptions.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/features/comments/data/models/comment_model.dart';
import 'package:my_anime/features/comments/domain/entities/comment.dart';
import 'package:my_anime/features/personalization/data/datasources/remote_data_source.dart';
import 'package:my_anime/features/personalization/domain/entities/user.dart';

abstract class CommentsRemoteDataSource {
  Future<Unit> addComment(CommentContentModel commentContent);
  Future<List<Comment>> getAllComments(int animeId);
  Future<Either<Failure, Unit>> removeComment(int id);
  Future<Either<Failure, Comment>> editComment(CommentContentModel comment);
}

class CommentsRemoteDataSourceImpl extends CommentsRemoteDataSource {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('comments');
  final RemoteDataSource usersDataSource;

  CommentsRemoteDataSourceImpl({required this.usersDataSource});

  @override
  Future<Unit> addComment(CommentContentModel commentContent) async {
    DocumentReference documentReference =
        collectionReference.doc('${commentContent.animeId}');

    DocumentReference commentsRef =
        documentReference.collection('comments').doc();

    //assign comment id
    commentContent.id = commentsRef.id;

    try {
      await commentsRef.set(commentContent.toJson());
      return Future.value(unit);
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<Either<Failure, Comment>> editComment(CommentContentModel comment) {
    // TODO: implement editComment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> removeComment(int id) {
    // TODO: implement removeComment
    throw UnimplementedError();
  }

  @override
  Future<List<Comment>> getAllComments(int animeId) async {
    try {
      //git documents snapshot
      QuerySnapshot snapshot = await collectionReference
          .doc('$animeId')
          .collection('comments')
          .get();

      //convert doc data to comment and store them in a list
      List<Future<Comment>> commentsFuture = snapshot.docs.map((doc) async {
        //get comment content and store it in CommentContent entity
        CommentContentModel commentContent =
            CommentContentModel.fromJson(doc.data() as Map<String, dynamic>);

        //get comment's user
        UserEntity user =
            await usersDataSource.getUserDetails(commentContent.userEmail);

        return Comment(commentContent: commentContent, user: user);
      }).toList();

      //await for comments future
      List<Comment> comments = await Future.wait(commentsFuture);

      return comments;
    } on Exception {
      throw ServerException();
    }
  }
}
