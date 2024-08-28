import 'dart:developer';
import 'package:isar/isar.dart';

part 'task_model.g.dart';

@collection
class TaskModel {
  TaskModel({
    this.creatorId,
    this.createdAt,
    this.assigneeId,
    this.assignerId,
    this.commentCount,
    this.isCompleted,
    this.content,
    this.description,
    this.due,
    this.duration,
    this.id = '',
    this.idFromBackend,
    this.labels,
    this.order,
    this.priority,
    this.projectId,
    this.sectionId,
    this.parentId,
    this.url,
    this.startTime,
    this.stopTime,
    this.elapsedTime,
    this.isTimerRunning,
    this.completionDate,
    this.timeIntervals = const [],
  });

  String? creatorId;
  DateTime? createdAt;
  String? assigneeId;
  String? assignerId;
  int? commentCount;
  bool? isCompleted;
  String? content;
  String? description;
  @embedded
  Due? due;

  @embedded
  DurationModel? duration;
  String id;
  String? idFromBackend;
  List<String>? labels;
  int? order;
  int? priority;
  String? projectId;
  String? sectionId;
  String? parentId;
  String? url;
  DateTime? startTime;
  DateTime? stopTime;
  int? elapsedTime;
  bool? isTimerRunning;
  // bool? isCompleted;
  DateTime? completionDate;
  List<TimeInterval> timeIntervals; // List of time intervals
  // bool? isTimerRunning; // Indicates if the timer is currently running

  // Static constructor for safe parsing and error handling
  static TaskModel? fromJson(Map<String, dynamic>? json) {
    try {
      if (json == null) return null;

      return TaskModel(
        creatorId: json['creator_id'] as String?,
        createdAt: DateTime.tryParse('${json['created_at']}'),
        assigneeId: json['assignee_id'] as String?,
        assignerId: json['assigner_id'] as String?,
        commentCount: int.tryParse('${json['comment_count']}'),
        isCompleted: json['is_completed'] as bool?,
        content: json['content'] as String?,
        description: json['description'] as String?,
        due: Due.fromJson(json['due'] as Map<String, dynamic>?),
        duration:
            DurationModel.fromJson(json['duration'] as Map<String, dynamic>?),
        id: '${json['id']}',
        idFromBackend:
            json['id'] as String? ?? json['idFromBackend'] as String?,
        labels: (json['labels'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList(),

        // json['labels'] ?? []),
        order: int.tryParse('${json['order']}'),
        priority: int.tryParse('${json['priority']}'),
        projectId: json['project_id'] as String?,
        sectionId: json['section_id'] as String?,
        parentId: json['parent_id'] as String?,
        url: json['url'] as String?,
        startTime: DateTime.tryParse('${json['startTime']}'),
        stopTime: DateTime.tryParse('${json['stopTime']}'),
        elapsedTime: int.tryParse('${json['elapsedTime']}'),
        isTimerRunning: json['isTimerRunning'] as bool?,
        completionDate: DateTime.tryParse('${json['completionDate']}'),
        timeIntervals: json['timeIntervals'] != null
            ? (json['timeIntervals'] as List)
                .map(
                  (dynamic e) {
                    if (e is Map) {
                      return TimeInterval(
                        startTime: DateTime.tryParse('${e['startTime']}'),
                        endTime: DateTime.tryParse('${e['endTime']}'),
                        isOngoing: '${e['isOngoing']}' == 'true',
                      );
                    }
                    return null;
                  },
                )
                .toList()
                .where((element) => element != null)
                .cast<TimeInterval>()
                .toList()
            : [],
      );
    } catch (error, stackTrace) {
      log('Error: $error');
      log('Stack Trace: $stackTrace');
      return null;
    }
  }

  // Convert Task object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'creator_id': creatorId,
      'created_at': createdAt?.toIso8601String(),
      'assignee_id': assigneeId,
      'assigner_id': assignerId,
      'comment_count': commentCount,
      'is_completed': isCompleted,
      'content': content,
      'description': description,
      'due': due?.toJson(),
      'duration': duration?.toJson(),
      'id': id,
      'labels': labels,
      'order': order,
      'priority': priority,
      'project_id': projectId,
      'section_id': sectionId,
      'parent_id': parentId,
      'url': url,
      'idFromBackend': idFromBackend,
      'startTime': startTime?.toIso8601String(),
      'stopTime': stopTime?.toIso8601String(),
      'elapsedTime': elapsedTime,
      'isTimerRunning': isTimerRunning,
      'completionDate': completionDate?.toIso8601String(),
      'timeIntervals': timeIntervals
          .map(
            (e) => {
              'startTime': e.startTime?.toIso8601String(),
              'endTime': e.endTime?.toIso8601String(),
              'isOngoing': e.isOngoing,
            },
          )
          .toList(),
    };
  }
}

@embedded
class Due {
  Due({
    this.date,
    this.isRecurring,
    this.dateTime,
    this.string,
    this.timezone,
  });

  final String? date;
  final bool? isRecurring;
  final String? dateTime;
  final String? string;
  final String? timezone;

  // Static constructor for safe parsing and error handling
  static Due? fromJson(Map<String, dynamic>? json) {
    try {
      if (json == null) return null;

      return Due(
        date: json['date'] as String?,
        isRecurring: json['is_recurring'] as bool?,
        dateTime: json['datetime'] as String?,
        string: json['string'] as String?,
        timezone: json['timezone'] as String?,
      );
    } catch (error, stackTrace) {
      log('Error: $error');
      log('Stack Trace: $stackTrace');
      return null;
    }
  }

  // Convert Due object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'is_recurring': isRecurring,
      'datetime': dateTime,
      'string': string,
      'timezone': timezone,
    };
  }
}

@embedded
class DurationModel {
  DurationModel({
    this.amount,
    this.unit,
  });

  final int? amount;
  final String? unit;

  // Static constructor for safe parsing and error handling
  static DurationModel? fromJson(Map<String, dynamic>? json) {
    try {
      if (json == null) return null;

      return DurationModel(
        amount: int.tryParse('${json['amount']}'),
        unit: json['unit'] as String?,
      );
    } catch (error, stackTrace) {
      log('Error: $error');
      log('Stack Trace: $stackTrace');
      return null;
    }
  }

  // Convert Duration object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'unit': unit,
    };
  }
}

@embedded
class TimeInterval {
  TimeInterval({
    this.startTime,
    this.endTime,
    this.isOngoing = true,
  });
  DateTime? startTime;
  DateTime? endTime;
  bool isOngoing;
}
