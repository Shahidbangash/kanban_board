// import 'package:hive/hive.dart';
import 'package:isar/isar.dart';
// import 'package:kanban_board/models/hive/hive_models.dart';
import 'package:kanban_board/models/project_model.dart';
import 'package:kanban_board/models/section_model.dart';
import 'package:kanban_board/models/task_comment_model.dart';
import 'package:kanban_board/models/task_model.dart';
import 'package:kanban_board/repositories/comments_repository.dart';
import 'package:kanban_board/repositories/project_repository.dart';
import 'package:kanban_board/repositories/section_repository.dart';
import 'package:kanban_board/repositories/task_repository.dart';

class SyncMiddleware {
  SyncMiddleware({
    required this.isar,
    // required this.projectRepository,
    // required this.taskRepository,
    // required this.sectionRepository,
    // required this.commentRepository,
  }) {
    // _setupListeners();
  }
  final Isar isar;
  final ProjectRepository _projectRepository = ProjectRepository();
  final TaskRepository _taskRepository = TaskRepository();
  final SectionRepository _sectionRepository = SectionRepository();
  final CommentRepository _commentRepository = CommentRepository();

  Future<void> setupListeners() async {
    // Listen for changes in the Project collection
    if (isar.projects.count() > 0) {
      isar.projects.watchLazy().listen((_) async {
        await syncProjects();
      });
    } else {
      // isar.projects.watchLazy().listen((_) async {
      await syncProjects();
      // });
    }

    if (isar.sectionModels.count() > 0) {
      // Listen for changes in the Section collection
      isar.sectionModels.watchLazy().listen((_) async {
        // get the project ID
        final projects = isar.projects.where().findAll();
        for (final project in projects) {
          await syncSections(project.idFromBackend ?? project.id);
        }
        // await _syncSections();
      });
    } else {
      final projects = isar.projects.where().findAll();
      for (final project in projects) {
        await syncSections(project.idFromBackend ?? project.id);
      }
    }

    // Listen for changes in the Task collection
    if (isar.taskModels.count() > 0) {
      isar.taskModels.watchLazy().listen((_) async {
        await _syncTasks();
      });
    } else {
      await _syncTasks();
    }

    if (isar.comments.count() > 0) {
      // Listen for changes in the Comment collection
      isar.comments.watchLazy().listen((_) async {
        await syncComments();
      });
    } else {
      await syncComments();
    }
  }

  Future<void> syncProjects() async {
    // Fetch all local projects
    // final localProjects = isar.projects.where().findAll();

    // for (final project in localProjects) {
    //   // Existing project, update it on the backend
    //   await _projectRepository.updateProject(project);
    // }

    // Optionally, you can also fetch projects from the API and update the local database.
    final remoteProjects = await _projectRepository.getAllProjects();
    if (remoteProjects != null) {
      await syncLocalWithRemoteProjects(remoteProjects);
    }
    // await _syncLocalWithRemoteProjects(remoteProjects );
  }

  Future<void> _syncTasks() async {
    final localTasks = isar.taskModels.where().findAll();

    for (final task in localTasks) {
      // Existing task, update it on the backend
      await _taskRepository.updateTask(task.id, task.toJson());
    }

    // Optionally, fetch remote tasks and sync locally
    final remoteTasks = await _taskRepository.getActiveTasks();
    if (remoteTasks != null) {
      await syncLocalWithRemoteTasks(remoteTasks);
    }
    // await _syncLocalWithRemoteTasks(remoteTasks!.map((e) => e.toJson()).toList());
  }

  Future<void> syncSections(String projectId) async {
    // final localSections = isar.sectionModels.where().findAll();

    // for (final section in localSections) {
    //   // Existing section, update it on the backend
    //   if (section.idFromBackend != null) {
    //     await _sectionRepository.updateSection(
    //       section.idFromBackend!,
    //       '${section.name}',
    //     );
    //   }
    // }

    // Optionally, fetch remote sections and sync locally
    final remoteSections =
        await _sectionRepository.getSectionsForProject(projectId);

    if (remoteSections != null) {
      await _syncLocalWithRemoteSections(remoteSections);
    }
  }

  Future<void> syncComments() async {
    // final localComments = isar.comments.where().findAll();

    // for (final comment in localComments) {
    //   // Existing comment, update it on the backend
    //   await _commentRepository.updateComment(
    //     comment.idFromBackend ?? comment.id,
    //     comment.toJson(),
    //   );
    // }

    // get the task ID
    final tasks = isar.taskModels.where().findAll();
    for (final task in tasks) {
      // await _syncCommentsForTask(task.id);
      // Optionally, fetch remote comments and sync locally
      final remoteComments = await _commentRepository.getCommentsForTask(
        task.idFromBackend ?? task.id,
      );
      if (remoteComments != null) {
        await syncLocalWithRemoteComments(remoteComments);
      }
      // await _syncLocalWithRemoteComments(remoteComments);
    }
  }

  Future<void> syncLocalWithRemoteProjects(List<Project> remoteProjects) async {
    // Logic to update the local database with remote projects

    await isar.write((isar) async {
      isar.projects.putAll(remoteProjects);
    });
  }

  Future<void> syncLocalWithRemoteTasks(List<TaskModel> remoteTasks) async {
    await isar.write((isar) async {
      isar.taskModels.putAll(remoteTasks);
    });
  }

  Future<void> _syncLocalWithRemoteSections(
    List<SectionModel> remoteSections,
  ) async {
    await isar.write((isar) async {
      isar.sectionModels.putAll(remoteSections);
    });
  }

  Future<void> syncLocalWithRemoteComments(List<Comment> remoteComments) async {
    await isar.write((isar) async {
      isar.comments.putAll(remoteComments);
    });
  }

  Future<void> deleteTask(String taskId) async {
    await isar.write((isar) async {
      isar.taskModels.delete(taskId);
    });
  }
}
