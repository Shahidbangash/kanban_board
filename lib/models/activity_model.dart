import 'package:isar/isar.dart';

part 'activity_model.g.dart';

@collection
class Activity {
  String id = ''; // Auto-incremented ID for each activity

  DateTime? dateTime; // The time and date of the activity

  String? description; // Description of what was done

  String? taskId; // The ID of the task associated with the activity

  String? projectId; // The ID of the project associated with the activity

  String? sectionId; // The ID of the section associated with the activity

  String? userId; // The ID of the user who performed the activity

  String? commentId; // The ID of the comment associated with the activity

  String? activityType; // The type of activity performed

  // Additional metadata can be added here if needed
}
