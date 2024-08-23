import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kanban_board/models/task_model.dart';
import 'package:kanban_board/repositories/task_repository.dart';
import 'package:kanban_board/utils/extensions.dart';

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
  final List<TaskModel?> tasks;

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
  const TaskClosed(this.taskId);
  final String taskId;

  @override
  List<Object?> get props => [taskId];
}

class TaskReopened extends TaskState {
  const TaskReopened(this.taskId);
  final String taskId;

  @override
  List<Object?> get props => [taskId];
}

class TaskDeleted extends TaskState {
  const TaskDeleted(this.taskId);
  final String taskId;

  @override
  List<Object?> get props => [taskId];
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
  Future<void> fetchActiveTasks() async {
    try {
      emit(TaskLoading());

      final tasks = await taskRepository.getActiveTasks();

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
    int? priority,
  }) async {
    try {
      emit(TaskLoading());

      final task = await taskRepository.createTask(
        content: content,
        dueString: dueString,
        dueLang: dueLang,
        priority: priority,
      );

      if (task != null) {
        emit(TaskCreated(task));
        await fetchActiveTasks(); // Re-fetch tasks to update the list
      } else {
        emit(const TaskError('Failed to create task.'));
      }
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  // Method to update an existing task
  Future<void> updateTask(
    String taskId,
    Map<String, dynamic> updatedFields,
  ) async {
    try {
      emit(TaskLoading());

      final task = await taskRepository.updateTask(taskId, updatedFields);

      if (task != null) {
        emit(TaskUpdated(task));
        await fetchActiveTasks(); // Re-fetch tasks to update the list
      } else {
        emit(const TaskError('Failed to update task.'));
      }
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  // Method to close a task
  Future<void> closeTask(String taskId) async {
    try {
      emit(TaskLoading());

      final success = await taskRepository.closeTask(taskId);

      if (success) {
        emit(TaskClosed(taskId));
        await fetchActiveTasks(); // Re-fetch tasks to update the list
      } else {
        emit(const TaskError('Failed to close task.'));
      }
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  // Method to reopen a task
  Future<void> reopenTask(String taskId) async {
    try {
      emit(TaskLoading());

      final success = await taskRepository.reopenTask(taskId);

      if (success) {
        emit(TaskReopened(taskId));
        await fetchActiveTasks(); // Re-fetch tasks to update the list
      } else {
        emit(const TaskError('Failed to reopen task.'));
      }
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  // Method to delete a task
  Future<void> deleteTask(String taskId) async {
    try {
      emit(TaskLoading());

      final success = await taskRepository.deleteTask(taskId);

      if (success) {
        emit(TaskDeleted(taskId));
        await fetchActiveTasks(); // Re-fetch tasks to update the list
      } else {
        emit(const TaskError('Failed to delete task.'));
      }
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void showAddTaskDialog(BuildContext context) {
    final contentController = TextEditingController();
    final dueStringController = TextEditingController();
    final dueLangController = TextEditingController();
    final priorityController = TextEditingController();

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
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Align(
                child: Text('Create New Task'),
              ),
              10.height,
              TextField(
                controller: contentController,
                decoration:
                    const InputDecoration(hintText: 'Enter task content'),
              ),
              10.height,
              TextField(
                controller: dueStringController,
                decoration: const InputDecoration(
                  hintText: 'Enter due string (optional)',
                ),
              ),
              10.height,
              TextField(
                controller: dueLangController,
                decoration: const InputDecoration(
                  hintText: 'Enter due language (optional)',
                ),
              ),
              10.height,
              TextField(
                controller: priorityController,
                decoration: const InputDecoration(
                  hintText: 'Enter priority (optional)',
                ),
                keyboardType: TextInputType.number,
              ),
              10.height,
              ElevatedButton(
                onPressed: () {
                  createTask(
                    content: contentController.text,
                    dueString: dueStringController.text,
                    dueLang: dueLangController.text,
                    priority: int.tryParse(priorityController.text),
                  );
                  Navigator.of(context).pop();
                },
                child: const Text('Create'),
              ),
              10.height,
            ],
          ),
        );
      },
    );
  }
}
