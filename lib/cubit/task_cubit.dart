import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kanban_board/models/activity_model.dart';
import 'package:kanban_board/models/section_model.dart';
import 'package:kanban_board/models/task_model.dart';
import 'package:kanban_board/repositories/task_repository.dart';
import 'package:kanban_board/utils/activity_services.dart';
import 'package:kanban_board/utils/extensions.dart';
import 'package:kanban_board/utils/middleware.dart';

// Task States
abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskCreated extends TaskState {
  const TaskCreated(this.task);
  final TaskModel task;

  @override
  List<Object?> get props => [task];
}

class TaskLoaded extends TaskState {
  const TaskLoaded(this.tasks);
  final List<TaskModel>? tasks;

  @override
  List<Object?> get props => [tasks];
}

class TaskUpdated extends TaskState {
  const TaskUpdated(this.task);
  final TaskModel task;

  @override
  List<Object?> get props => [task];
}

class TaskClosed extends TaskState {
  const TaskClosed(this.taskModel);
  final TaskModel taskModel;

  @override
  List<Object?> get props => [taskModel];
}

class TaskReopened extends TaskState {
  const TaskReopened(this.task);
  final TaskModel task;

  @override
  List<Object?> get props => [task];
}

class TaskDeleted extends TaskState {
  const TaskDeleted(this.taskModel);
  final TaskModel taskModel;

  @override
  List<Object?> get props => [taskModel];
}

class TaskError extends TaskState {
  const TaskError(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}

// TaskCubit Class
class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this.taskRepository) : super(TaskInitial());
  final TaskRepository taskRepository;

  // Method to fetch active tasks
  Future<void> fetchActiveTasks({
    String? sectionId,
    String? projectId,
  }) async {
    try {
      emit(TaskLoading());

      final tasks = await taskRepository.getActiveTasks(
        sectionId: sectionId,
        projectId: projectId,
      );

      if (tasks != null) {
        emit(TaskLoaded(tasks));
      } else {
        emit(const TaskError('Failed to fetch tasks.'));
      }
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  // Method to create a new task
  Future<void> createTask({
    required String content,
    String? dueString,
    String? dueLang,
    String? description,
    String? sectionId,
    String? projectId,
    int? priority,
  }) async {
    try {
      emit(TaskLoading());

      final task = await taskRepository.createTask(
        content: content,
        dueString: dueString,
        dueLang: dueLang,
        description: description,
        sectionId: sectionId,
        projectId: projectId,
        priority: priority,
      );

      if (task != null) {
        // emit(TaskCreated(task));
        await SyncMiddleware().syncLocalWithRemoteTasks([task]);
        // await fetchActiveTasks(
        //   projectId: task.projectId,
        //   sectionId: task.sectionId,
        // ); // Re-fetch tasks to update the list
      } else {
        emit(const TaskError('Failed to create task.'));
      }
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  // Method to update an existing task
  Future<void> updateTask(
    TaskModel taskModel,
    Map<String, dynamic> updatedFields,
  ) async {
    try {
      emit(TaskLoading());

      final task = await taskRepository.updateTask(taskModel.id, updatedFields);
      if (task != null) {
        await SyncMiddleware().syncLocalWithRemoteTasks([task]);
      }

      if (task != null) {
        await ActivityService().logActivity(
          description: 'Task `${task.content}` Updated',
          taskId: task.idFromBackend ?? task.id,
          projectId: task.projectId,
        );

        emit(TaskUpdated(task));
        // await fetchActiveTasks(
        //   sectionId: task.sectionId,
        //   projectId: task.projectId,
        // ); // Re-fetch tasks to update the list
      } else {
        emit(const TaskError('Failed to update task.'));
      }
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  // Method to close a task
  Future<void> closeTask(TaskModel task) async {
    try {
      emit(TaskLoading());

      final success =
          await taskRepository.closeTask(task.idFromBackend ?? task.id);

      if (success) {
        emit(TaskClosed(task));
        task.isCompleted = true;

        await SyncMiddleware().syncLocalWithRemoteTasks([task]);
        await ActivityService().logActivity(
          description:
              'Task `${task.content}` Completed in `${task.sectionId}` section',
          taskId: task.idFromBackend ?? task.id,
          projectId: task.projectId,
        );

        // await fetchActiveTasks(
        //   sectionId: task.sectionId,
        //   projectId: task.projectId,
        // ); // Re-fetch tasks to update the list
      } else {
        emit(const TaskError('Failed to close task.'));
      }
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  // Method to reopen a task
  Future<void> reopenTask(TaskModel task) async {
    try {
      emit(TaskLoading());

      final success = await taskRepository.reopenTask(
        task.idFromBackend ?? task.id,
      );

      if (success) {
        emit(TaskReopened(task));
        task.isCompleted = false;
        await SyncMiddleware().syncLocalWithRemoteTasks([task]);
        await ActivityService().logActivity(
          description:
              'Task `${task.content}` Re-Opened in `${task.sectionId}` section',
          taskId: task.idFromBackend ?? task.id,
          projectId: task.projectId,
        );
      } else {
        emit(const TaskError('Failed to reopen task.'));
      }
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  // Method to delete a task
  Future<void> deleteTask(TaskModel task) async {
    try {
      emit(TaskLoading());

      await SyncMiddleware().deleteTask(task.id);
      final success =
          await taskRepository.deleteTask(task.idFromBackend ?? task.id);

      if (success) {
        emit(TaskDeleted(task));
        // await fetchActiveTasks(
        //   projectId: task.projectId,
        //   sectionId: task.sectionId,
        // ); // Re-fetch tasks to update the list
      } else {
        emit(const TaskError('Failed to delete task.'));
      }
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  // Since Api does not allow changing of section so we should delete task from section and create a new task in the new section
  Future<void> onCardMoved({
    required TaskModel task,
    required SectionModel fromSection,
    required SectionModel toSection,
  }) async {
    log('Moving task ${task.content} from ${fromSection.name} to ${toSection.name}');

    log('Task ID: ${toSection.id}');
    if (fromSection.id == toSection.id) {
      return;
    }
    // await createTask(
    //   content: task.content ?? '',
    //   dueString: task.due?.dateTime,
    //   // dueLang: task.lan,
    //   description: task.description,
    //   sectionId: toSection.id,
    //   projectId: toSection.projectId,
    //   priority: task.priority,
    //   // dueLang: task.due?.lang,
    // );

    final taskModel = await taskRepository.createTask(
      content: task.content ?? '',
      dueString: task.due?.dateTime,
      // dueLang: task.lan,
      description: task.description,
      sectionId: toSection.id,
      projectId: toSection.projectId,
      priority: task.priority,
      // dueLang: task.due?.lang,
    );
    // ----- Once Created then delete the task from the original section -----
    await deleteTask(task);

    await SyncMiddleware().deleteTask(task.idFromBackend ?? task.id);

    if (taskModel != null) {
      await SyncMiddleware().syncLocalWithRemoteTasks([taskModel]);
    }

    // Log the activity of moving the task
    await ActivityService().logActivity(
      description: 'Task moved from ${fromSection.name} to ${toSection.name}',
      taskId: task.idFromBackend ?? task.id,
      projectId: task.projectId,
    );

    // now fetch the tasks again
    // await fetchActiveTasks(
    //   sectionId: fromSection.id,
    //   projectId: fromSection.projectId,
    // );

    // await fetchActiveTasks(
    //   sectionId: toSection.id,
    //   projectId: toSection.projectId,
    // );
    //  we need to fetch again to remove the task from the list
  }

  void showAddTaskDialog(
    BuildContext context,
    String? sectionId,
    String? projectId, {
    bool isEdit = false,
    TaskModel? task,
  }) {
    final contentController = TextEditingController();
    final descriptionController = TextEditingController();
    final dueStringController = TextEditingController();
    final dueLangController = TextEditingController();
    final priorityController = TextEditingController();

    if (isEdit) {
      contentController.text = task?.content ?? '';
      descriptionController.text = task?.description ?? '';
      dueStringController.text = task?.due?.dateTime ?? '';
      // dueLangController.text = task?.due?.lang ?? '';
      priorityController.text = task?.priority.toString() ?? '';
    }

    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        // return AlertDialog(
        //   title: ,
        //   content: ,
        //   actions: [
        //     TextButton(
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //       },
        //       child: const Text('Cancel'),
        //     ),
        //     ElevatedButton(
        //       onPressed: () {
        //         createTask(
        //           content: contentController.text,
        //           dueString: dueStringController.text,
        //           dueLang: dueLangController.text,
        //           priority: int.tryParse(priorityController.text),
        //         );
        //         Navigator.of(context).pop();
        //       },
        //       child: const Text('Create'),
        //     ),
        //   ],
        // );
        return StatefulBuilder(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Create New Task',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  10.height,
                  TextField(
                    controller: contentController,
                    decoration:
                        const InputDecoration(hintText: 'Enter task content'),
                  ),
                  10.height,
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      hintText: 'Enter task description (optional)',
                    ),
                    minLines: 3,
                    maxLines: 5,
                  ),
                  10.height,
                  Row(
                    children: [
                      // Expanded(
                      //   child: DropdownButton<String>(
                      //     // value: dueLangController.text,
                      //     hint: const Text('Select language'),
                      //     underline: Container(
                      //       height: 2,
                      //       color: Colors.deepPurpleAccent,
                      //     ),
                      //     isExpanded: true,
                      //     onChanged: (String? value) {
                      //       langua.text = value ?? '';
                      //     },
                      //     items: <String>[
                      //       'en',
                      //       'es',
                      //       'de',
                      //     ].map<DropdownMenuItem<String>>((String value) {
                      //       return DropdownMenuItem<String>(
                      //         value: value,
                      //         child: Text(value),
                      //       );
                      //     }).toList(),
                      //   ),
                      // ),
                      // 10.width,
                      Expanded(
                        child: DropdownButton<String>(
                          // value: dueLangController.text,
                          hint: Text(
                            priorityController.text.isNotEmpty
                                ? priorityController.text
                                : 'Priority',
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          isExpanded: true,
                          onChanged: (String? value) {
                            state.call(() {
                              priorityController.text = value ?? '';
                            });
                          },
                          items: <String>['p1', 'p2', 'p3', 'p4']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  20.height,
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: MaterialButton(
                          onPressed: () async {
                            final picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2025),
                              builder: (context, child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    colorScheme: const ColorScheme.light(
                                      primary: Colors.deepPurple,
                                    ),
                                    dialogBackgroundColor: Colors.white,
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (picked != null) {
                              dueStringController.text =
                                  picked.toIso8601String();
                              state(() {});
                            }
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today),
                              10.width,
                              Text(
                                dueStringController.text.isNotEmpty
                                    ? dueStringController.text
                                    : 'Select Due Date',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.height,
                  ElevatedButton(
                    onPressed: () {
                      if (isEdit) {
                        updateTask(
                          task!,
                          {
                            'content': contentController.text,
                            'dueString': dueStringController.text,
                            'dueLang': dueLangController.text,
                            'priority': int.tryParse(priorityController.text),
                            'description': descriptionController.text,
                          },
                        );
                        Navigator.of(context).pop();
                        return;
                      }
                      createTask(
                        content: contentController.text,
                        dueString: dueStringController.text,
                        dueLang: dueLangController.text,
                        priority: int.tryParse(priorityController.text),
                        description: descriptionController.text,
                        sectionId: sectionId,
                        projectId: projectId,
                      );
                      Navigator.of(context).pop();
                    },
                    child: isEdit
                        ? const Text('Update Task')
                        : const Text('Create Task'),
                  ),
                  10.height,
                ],
              ),
            );
          },
        );
      },
    );
  }
}
