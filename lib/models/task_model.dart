import 'dart:developer';

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
    this.id,
    this.labels,
    this.order,
    this.priority,
    this.projectId,
    this.sectionId,
    this.parentId,
    this.url,
  });

  final String? creatorId;
  final DateTime? createdAt;
  final String? assigneeId;
  final String? assignerId;
  final int? commentCount;
  final bool? isCompleted;
  final String? content;
  final String? description;
  final Due? due;
  final DurationModel? duration;
  final String? id;
  final List<String>? labels;
  final int? order;
  final int? priority;
  final String? projectId;
  final String? sectionId;
  final String? parentId;
  final String? url;

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
        id: json['id'] as String?,
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
    };
  }
}

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
