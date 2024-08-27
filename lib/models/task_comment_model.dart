import 'dart:developer';
import 'package:isar/isar.dart';

part 'task_comment_model.g.dart';

@collection
class Comment {
  Comment({
    this.content,
    this.id = '',
    this.postedAt,
    this.projectId,
    this.taskId,
    this.attachment,
    this.idFromBackend,
  });

  String? content;
  String id;
  String? idFromBackend;
  DateTime? postedAt;
  String? projectId;
  String? taskId;
  @embedded
  Attachment? attachment;

  // Static constructor for error-handling
  static Comment? fromJson(Map<String, dynamic>? json) {
    try {
      if (json == null) return null;

      return Comment(
        content: json['content'] as String?,
        id: '${json['id']}',
        idFromBackend: '${json['idFromBackend'] ?? json['id']}',
        postedAt: DateTime.tryParse('${json['posted_at']}'),
        projectId: json['project_id'] as String?,
        taskId: json['task_id'] as String?,
        attachment:
            Attachment.fromJson(json['attachment'] as Map<String, dynamic>?),
      );
    } catch (error, stackTrace) {
      log('Error in Comment.fromJson: $error');
      log('Stack Trace: $stackTrace');
      return null;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'id': id,
      'posted_at': postedAt?.toIso8601String(),
      'project_id': projectId,
      'task_id': taskId,
      'attachment': attachment?.toJson(),
      'idFromBackend': idFromBackend,
    };
  }
}

@embedded
class Attachment {
  Attachment({
    this.fileName,
    this.fileType,
    this.fileUrl,
    this.resourceType,
  });

  final String? fileName;
  final String? fileType;
  final String? fileUrl;
  final String? resourceType;

  static Attachment? fromJson(Map<String, dynamic>? json) {
    try {
      if (json == null) return null;

      return Attachment(
        fileName: json['file_name'] as String?,
        fileType: json['file_type'] as String?,
        fileUrl: json['file_url'] as String?,
        resourceType: json['resource_type'] as String?,
      );
    } catch (error, stackTrace) {
      log('Error in Attachment.fromJson: $error');
      log('Stack Trace: $stackTrace');
      return null;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'file_name': fileName,
      'file_type': fileType,
      'file_url': fileUrl,
      'resource_type': resourceType,
    };
  }
}
