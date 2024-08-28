// import 'dart:developer';

// import 'package:hive/hive.dart';

// part 'models.g.dart'; // Generated file for Hive adapters

// @HiveType(typeId: 2)
// class Task extends HiveObject {
//   Task({
//     this.creatorId,
//     this.createdAt,
//     this.assigneeId,
//     this.assignerId,
//     this.commentCount,
//     this.isCompleted,
//     this.content,
//     this.description,
//     this.due,
//     this.duration,
//     this.id,
//     this.labels,
//     this.order,
//     this.priority,
//     this.projectId,
//     this.sectionId,
//     this.parentId,
//     this.url,
//   });
//   @HiveField(0)
//   String? creatorId;

//   @HiveField(1)
//   DateTime? createdAt;

//   @HiveField(2)
//   String? assigneeId;

//   @HiveField(3)
//   String? assignerId;

//   @HiveField(4)
//   int? commentCount;

//   @HiveField(5)
//   bool? isCompleted;

//   @HiveField(6)
//   String? content;

//   @HiveField(7)
//   String? description;

//   @HiveField(8)
//   Due? due;

//   @HiveField(9)
//   DurationModel? duration;

//   @HiveField(10)
//   String? id;

//   @HiveField(11)
//   List<String>? labels;

//   @HiveField(12)
//   int? order;

//   @HiveField(13)
//   int? priority;

//   @HiveField(14)
//   String? projectId;

//   @HiveField(15)
//   String? sectionId;

//   @HiveField(16)
//   String? parentId;

//   @HiveField(17)
//   String? url;
// }

// @HiveType(typeId: 3)
// class Due extends HiveObject {
//   Due({
//     this.date,
//     this.isRecurring,
//     this.datetime,
//     this.string,
//     this.timezone,
//   });
//   @HiveField(0)
//   String? date;

//   @HiveField(1)
//   bool? isRecurring;

//   @HiveField(2)
//   String? datetime;

//   @HiveField(3)
//   String? string;

//   @HiveField(4)
//   String? timezone;
// }

// @HiveType(typeId: 4)
// class DurationModel extends HiveObject {
//   DurationModel({
//     this.amount,
//     this.unit,
//   });
//   @HiveField(0)
//   int? amount;

//   @HiveField(1)
//   String? unit;
// }

// @HiveType(typeId: 5)
// class TaskComment extends HiveObject {
//   TaskComment({
//     this.content,
//     this.id,
//     this.postedAt,
//     this.projectId,
//     this.taskId,
//     this.attachment,
//   });
//   @HiveField(0)
//   String? content;

//   @HiveField(1)
//   String? id;

//   @HiveField(2)
//   DateTime? postedAt;

//   @HiveField(3)
//   String? projectId;

//   @HiveField(4)
//   String? taskId;

//   @HiveField(5)
//   Attachment? attachment;
// }

// @HiveType(typeId: 6)
// class Attachment extends HiveObject {
//   Attachment({
//     this.fileName,
//     this.fileType,
//     this.fileUrl,
//     this.resourceType,
//   });
//   @HiveField(0)
//   String? fileName;

//   @HiveField(1)
//   String? fileType;

//   @HiveField(2)
//   String? fileUrl;

//   @HiveField(3)
//   String? resourceType;
// }
