import 'package:isar/isar.dart';
// import 'package:kanban_board/models/activity.dart';
import 'package:kanban_board/models/activity_model.dart';
import 'package:kanban_board/utils/isar.dart';

class ActivityService {
  final Isar isar = IsarService().isarInstance;

  Future<void> logActivity({
    required String description,
    String? taskId,
    String? projectId,
  }) async {
    final activity = Activity()
      ..dateTime = DateTime.now()
      ..description = description
      ..taskId = taskId
      ..projectId = projectId;

    await isar.write((isar) async {
      isar.activitys.putAll([activity]);
    });
  }

  // Method to retrieve all activities for a specific task or project
  Stream<List<Activity>> watchActivities({String? taskId, String? projectId}) {
    final query = isar.activitys.where();

    if (taskId != null) {
      query.taskIdEqualTo(taskId);
    }

    if (projectId != null) {
      query.projectIdEqualTo(projectId);
    }

    return query.sortByDateTimeDesc().watch(fireImmediately: true);
  }
}
