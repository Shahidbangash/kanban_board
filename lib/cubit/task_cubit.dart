import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kanban_board/models/project_model.dart';
import 'package:kanban_board/repositories/task_repository.dart';

// States for TaskCubit
abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class ProjectsLoaded extends TaskState {
  const ProjectsLoaded(this.projects);
  final List<Project> projects;

  @override
  List<Object?> get props => [projects];
}

class TaskCreated extends TaskState {
  const TaskCreated(this.taskData);
  final Project? taskData;

  @override
  List<Object?> get props => [taskData];
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

  // Method to create a new project (task)
  Future<void> createProject(String projectName) async {
    try {
      emit(TaskLoading()); // Emit loading state

      // Call the repository to create the project
      final projectData = await taskRepository.createProject(projectName);

      // Emit the created state with the project data
      emit(TaskCreated(projectData));
    } catch (e) {
      // Emit error state if something goes wrong
      emit(TaskError(e.toString()));
    }
  }

  // fetch all projects
  Future<void> fetchAllProjects() async {
    try {
      emit(TaskLoading()); // Emit loading state

      // Call the repository to get all projects
      final projects = await taskRepository.getAllProjects();

      // Emit the loaded state with the list of projects
      emit(ProjectsLoaded(projects ?? []));
    } catch (e) {
      // Emit error state if something goes wrong
      emit(TaskError(e.toString()));
    }
  }
}
