import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kanban_board/models/task_comment_model.dart';
import 'package:kanban_board/repositories/comments_repository.dart';
import 'package:kanban_board/utils/activity_services.dart';
import 'package:kanban_board/utils/middleware.dart';

// States for CommentCubit
abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object?> get props => [];
}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentLoaded extends CommentState {
  const CommentLoaded(this.comments);
  final List<Comment?> comments;

  @override
  List<Object?> get props => [comments];
}

class CommentCreated extends CommentState {
  const CommentCreated(this.comment);
  final Comment comment;

  @override
  List<Object?> get props => [comment];
}

class CommentUpdated extends CommentState {
  const CommentUpdated(this.comment);
  final Comment comment;

  @override
  List<Object?> get props => [comment];
}

class CommentDeleted extends CommentState {
  const CommentDeleted(this.commentId);
  final String commentId;

  @override
  List<Object?> get props => [commentId];
}

class CommentError extends CommentState {
  const CommentError(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}

// CommentCubit Class
class CommentCubit extends Cubit<CommentState> {
  CommentCubit(this.commentRepository) : super(CommentInitial());
  final CommentRepository commentRepository;

  // Fetch comments for a task
  Future<void> fetchComments(String taskId) async {
    try {
      emit(CommentLoading());

      final comments = await commentRepository.getCommentsForTask(taskId);

      if (comments != null) {
        emit(CommentLoaded(comments));
      } else {
        emit(const CommentError('Failed to fetch comments.'));
      }
    } catch (e) {
      emit(CommentError(e.toString()));
    }
  }

  // Create a new comment
  Future<void> createComment(Map<String, dynamic> commentData) async {
    try {
      emit(CommentLoading());

      final comment = await commentRepository.createComment(commentData);

      if (comment != null) {
        // IsarService().isarInstance.comments.put(comment);
        await SyncMiddleware().syncLocalWithRemoteComments(
          [comment],
        );

        await SyncMiddleware().addCommentCountToTask(
          comment.taskId ?? '',
        );

        // Log the activity of adding a comment
        await ActivityService().logActivity(
          description: 'Comment added: ${comment.content}',
          taskId: comment.taskId,
          projectId: comment.projectId,
        );
        emit(CommentCreated(comment));
        if (commentData['task_id'] != null) {
          await fetchComments(
            '${commentData['task_id']}',
          ); // Re-fetch comments to update the list
        }
      } else {
        emit(const CommentError('Failed to create comment.'));
      }
    } catch (e) {
      emit(CommentError(e.toString()));
    }
  }

  // Update a comment
  Future<void> updateComment(
    String commentId,
    Map<String, dynamic> updateData,
  ) async {
    try {
      emit(CommentLoading());

      final comment =
          await commentRepository.updateComment(commentId, updateData);

      if (comment != null) {
        emit(CommentUpdated(comment));
        if (updateData['task_id'] != null) {
          await fetchComments(
            '${updateData['task_id']}',
          ); // Re-fetch comments to update the list
        }
      } else {
        emit(const CommentError('Failed to update comment.'));
      }
    } catch (e) {
      emit(CommentError(e.toString()));
    }
  }

  // Delete a comment
  Future<void> deleteComment(String commentId, String taskId) async {
    try {
      emit(CommentLoading());

      final success = await commentRepository.deleteComment(commentId);

      if (success) {
        emit(CommentDeleted(commentId));
        await fetchComments(taskId); // Re-fetch comments to update the list
      } else {
        emit(const CommentError('Failed to delete comment.'));
      }
    } catch (e) {
      emit(CommentError(e.toString()));
    }
  }
}
