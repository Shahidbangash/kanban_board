import 'dart:developer';
import 'package:kanban_board/models/task_comment_model.dart';
import 'package:kanban_board/utils/network_utils.dart';

class CommentRepository {
  /// Fetch all comments for a task
  Future<List<Comment>?> getCommentsForTask(String taskId) async {
    try {
      final response = await buildHttpResponse(
        endPoint: 'comments?task_id=$taskId',
      );

      final data = await handleResponse(response);

      if (data is List) {
        return List<Comment>.from(
          data
              .map((commentJson) {
                return Comment.fromJson(commentJson as Map<String, dynamic>?);
              })
              .where((element) => element != null)
              .cast<Comment>(),
        );
      }

      return null;
    } catch (error, stackTrace) {
      log('Error at `getCommentsForTask`: $error');
      log('Stack Trace: $stackTrace');
      return null;
    }
  }

  /// Create a new comment
  Future<Comment?> createComment(Map<String, dynamic> commentData) async {
    try {
      final response = await buildHttpResponse(
        endPoint: 'comments',
        method: HttpMethod.post,
        request: commentData,
      );

      final data = await handleResponse(response);

      return Comment.fromJson(data as Map<String, dynamic>?);
    } catch (error, stackTrace) {
      log('Error at `createComment`: $error');
      log('Stack Trace: $stackTrace');
      return null;
    }
  }

  /// Update a comment
  Future<Comment?> updateComment(
    String commentId,
    Map<String, dynamic> updateData,
  ) async {
    try {
      final response = await buildHttpResponse(
        endPoint: 'comments/$commentId',
        method: HttpMethod.post,
        request: updateData,
      );

      final data = await handleResponse(response);

      return Comment.fromJson(data as Map<String, dynamic>?);
    } catch (error, stackTrace) {
      log('Error at `updateComment`: $error');
      log('Stack Trace: $stackTrace');
      return null;
    }
  }

  /// Delete a comment
  Future<bool> deleteComment(String commentId) async {
    try {
      final response = await buildHttpResponse(
        endPoint: 'comments/$commentId',
        method: HttpMethod.delete,
      );

      return response.statusCode == 204;
    } catch (error, stackTrace) {
      log('Error at `deleteComment`: $error');
      log('Stack Trace: $stackTrace');
      return false;
    }
  }
}
