import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kanban_board/models/project_model.dart';
import 'package:kanban_board/repositories/project_repository.dart';

// States for TaskCubit
abstract class ProjectState extends Equatable {
  const ProjectState();

  @override
  List<Object?> get props => [];
}

class ProjectInitial extends ProjectState {}

class ProjectLoading extends ProjectState {}

class ProjectsLoaded extends ProjectState {
  const ProjectsLoaded(this.projects);
  final List<Project> projects;

  @override
  List<Object?> get props => [projects];
}

class ProjectCreated extends ProjectState {
  const ProjectCreated(this.taskData);
  final Project? taskData;

  @override
  List<Object?> get props => [taskData];
}

class ProjectError extends ProjectState {
  const ProjectError(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}

// TaskCubit Class
class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit(this.projectRepository) : super(ProjectInitial());
  final ProjectRepository projectRepository;

  // Method to create a new project (task)
  Future<void> createProject(String projectName) async {
    try {
      emit(ProjectLoading()); // Emit loading state

      // Call the repository to create the project
      final projectData = await projectRepository.createProject(projectName);

      // Emit the created state with the project data
      emit(ProjectCreated(projectData));
    } catch (e) {
      // Emit error state if something goes wrong
      emit(ProjectError(e.toString()));
    }
  }

  // fetch all projects
  Future<void> fetchAllProjects() async {
    try {
      emit(ProjectLoading()); // Emit loading state

      // Call the repository to get all projects
      final projects = await projectRepository.getAllProjects();

      // Emit the loaded state with the list of projects
      emit(ProjectsLoaded(projects ?? []));
    } catch (e) {
      // Emit error state if something goes wrong
      emit(ProjectError(e.toString()));
    }
  }
}
