import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:my_anime/core/errors/failures.dart';
import 'package:my_anime/core/strings/failure_messages.dart';
import 'package:my_anime/features/comments/domain/entities/comment.dart';
import 'package:my_anime/features/comments/domain/usecases/add_comment_usecase.dart';
import 'package:my_anime/features/comments/domain/usecases/get_all_comments_usecase.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  //usecases
  final AddCommentUseCase addCommentUseCase;
  final GetAllCommentsUsecase getAllCommentsUsecase;

  CommentBloc(
      {required this.getAllCommentsUsecase, required this.addCommentUseCase})
      : super(CommentInitial()) {
    on<CommentEvent>((event, emit) async {
      emit(Loading());

      if (event is AddCommentEvent) {
        final response = await addCommentUseCase(event.text, event.animeId);
        //emit add comment states
        CommentState commentState = getAddingCommentState(response);
        if (commentState is Succeed) {
          final allCommentsResponse =
              await getAllCommentsUsecase(event.animeId);

          //emite get all comments states
          emit(getAllcommentsState(allCommentsResponse));
        } else {
          emit(commentState);
        }
      } else if (event is GetAllCommentsEvent) {
        final response = await getAllCommentsUsecase(event.animeId);

        //emite get all comments states
        emit(getAllcommentsState(response));
      }
    });
  }

  CommentState getAddingCommentState(Either<Failure, Unit> response) =>
      response.fold(
        (failure) =>
            Failed(message: failure.message ?? FailureMessages.undefinedError),
        (_) => Succeed(),
      );

  CommentState getAllcommentsState(Either<Failure, List<Comment>> response) =>
      response.fold(
        (failure) =>
            Failed(message: failure.message ?? FailureMessages.undefinedError),
        (comments) => CommentsRetrieved(comments: comments),
      );
}
