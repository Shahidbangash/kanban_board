import 'dart:developer';

import 'package:isar/isar.dart' show Isar;
// For getting the application directory

import 'package:kanban_board/models/project_model.dart';
import 'package:kanban_board/models/section_model.dart';
import 'package:kanban_board/models/task_comment_model.dart';
import 'package:kanban_board/models/task_model.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  factory IsarService() {
    return _instance;
  }

  IsarService._internal() {
    _initIsar();
  }
  static final IsarService _instance = IsarService._internal();
  late final Isar isarInstance;

  // Future<void> _initIsar() async {
  //   final dir = await getApplicationDocumentsDirectory();
  //   isarInstance = Isar.open(
  //     schemas: [ProjectSchema],
  //     directory: dir.path,
  //   );
  // }

  Future<Isar> _initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    final open = Isar.open(
      schemas: [
        ProjectSchema,
        SectionModelSchema,
        TaskModelSchema,
        CommentSchema,
      ],
      directory: dir.path,
    );
    try {
      isarInstance = open;
    } catch (error, stackTrace) {
      log('Error: $error');
      log('Stacktrace: $stackTrace');
    }
    return Isar.open(
      schemas: [
        ProjectSchema,
        SectionModelSchema,
        TaskModelSchema,
        CommentSchema,
      ],
      directory: dir.path,
    );

    // return isarInstance;
  }

  Future<void> syncData() async {
    // Sync data with the server

    // Initialize repositories
    // final projectRepository = ProjectRepository();
    // final taskRepository = TaskRepository();
    // final sectionRepository = SectionRepository();
    // final commentRepository = CommentRepository();
    // final isar = await _initIsar();
    // Initialize middleware
    // final syncMiddleware = SyncMiddleware().s;
  }
}
