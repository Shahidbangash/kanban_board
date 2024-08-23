import 'dart:developer';
import 'package:kanban_board/models/task_model.dart';
import 'package:kanban_board/utils/network_utils.dart';
// import 'package:kanban_board/repositories/models/task_model.dart';

class TaskRepository {
  /// Fetch active tasks from the Todoist API
  Future<List<TaskModel>?> getActiveTasks() async {
    try {
      final response = await buildHttpResponse(
        endPoint: 'tasks', // Endpoint for fetching active tasks
      );

      final data = await handleResponse(response);

      if (data is Map && data.containsKey('error')) {
        throw Exception(data['message']);
      }

      if (data is List) {
        return List<TaskModel>.from(
          data
              .map((taskJson) {
                return TaskModel.fromJson(taskJson as Map<String, dynamic>?);
              })
              .where((element) => element != null)
              .cast<TaskModel>(),
        );
      }

      return null;
    } catch (error, stackTrace) {
      log('Error at `getActiveTasks`: $error');
      log('Stack Trace: $stackTrace');
      return null;
    }
  }

  /// Create a new task
  Future<TaskModel?> createTask({
    required String content,
    String? dueString,
    String? dueLang,
    int? priority,
  }) async {
    try {
      final response = await buildHttpResponse(
        endPoint: 'tasks',
        method: HttpMethod.post,
        request: {
          'content': content,
          'due_string': dueString,
          'due_lang': dueLang,
          'priority': priority,
        },
      );

      final data = await handleResponse(response);

      if (data is Map && data.containsKey('error')) {
        throw Exception(data['message']);
      }

      return TaskModel.fromJson(data as Map<String, dynamic>?);
    } catch (error, stackTrace) {
      log('Error at `createTask`: $error');
      log('Stack Trace: $stackTrace');
      return null;
    }
  }

  /// Update an existing task
  Future<TaskModel?> updateTask(
    String taskId,
    Map<String, dynamic> updatedFields,
  ) async {
    try {
      final response = await buildHttpResponse(
        endPoint: 'tasks/$taskId',
        method: HttpMethod.post,
        request: updatedFields,
      );

      final data = await handleResponse(response);

      if (data is Map && data.containsKey('error')) {
        throw Exception(data['message']);
      }

      return TaskModel.fromJson(data as Map<String, dynamic>?);
    } catch (error, stackTrace) {
      log('Error at `updateTask`: $error');
      log('Stack Trace: $stackTrace');
      return null;
    }
  }

  /// Close a task
  Future<bool> closeTask(String taskId) async {
    try {
      final response = await buildHttpResponse(
        endPoint: 'tasks/$taskId/close',
        method: HttpMethod.post,
      );

      return response.statusCode == 204;
    } catch (error, stackTrace) {
      log('Error at `closeTask`: $error');
      log('Stack Trace: $stackTrace');
      return false;
    }
  }

  /// Reopen a task
  Future<bool> reopenTask(String taskId) async {
    try {
      final response = await buildHttpResponse(
        endPoint: 'tasks/$taskId/reopen',
        method: HttpMethod.post,
      );

      return response.statusCode == 204;
    } catch (error, stackTrace) {
      log('Error at `reopenTask`: $error');
      log('Stack Trace: $stackTrace');
      return false;
    }
  }

  /// Delete a task
  Future<bool> deleteTask(String taskId) async {
    try {
      final response = await buildHttpResponse(
        endPoint: 'tasks/$taskId',
        method: HttpMethod.delete,
      );

      return response.statusCode == 204;
    } catch (error, stackTrace) {
      log('Error at `deleteTask`: $error');
      log('Stack Trace: $stackTrace');
      return false;
    }
  }
}
