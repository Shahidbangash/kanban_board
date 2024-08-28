import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kanban_board/cubit/task_cubit.dart';
import 'package:kanban_board/models/project_model.dart';
import 'package:kanban_board/repositories/project_repository.dart';
import 'package:kanban_board/utils/extensions.dart';
import 'package:kanban_board/utils/isar.dart';
import 'package:kanban_board/utils/middleware.dart';

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

      if (projectData != null) {
        // sync it with the local database
        await SyncMiddleware(isar: IsarService().isarInstance)
            .syncLocalWithRemoteProjects(
          [projectData],
        );
      }

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

  void showAddProjectBottomBar(BuildContext context) {
    final projectNameController = TextEditingController();
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.height,
              Text(
                'Create a new project',
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              10.height,
              TextField(
                controller: projectNameController,
                decoration:
                    const InputDecoration(hintText: 'Enter Project Name'),
              ),
              20.height,
              Align(
                child: ElevatedButton(
                  onPressed: () {
                    // Trigger fetching all projects using TaskCubit
                    createProject(projectNameController.text);
                    // close the bottom sheet
                    Navigator.pop(context);
                  },
                  child: const Text('Create Project'),
                ),
              ),
              10.height,
              // ElevatedButton(
              //   onPressed: () {
              //     // Trigger the creation of the project using TaskCubit
              //     context
              //         .read<TaskCubit>()
              //         .createProject(projectNameController.text);
              //   },
              //   child: const Text('Create Project'),
              // ),
              // 10.height,
              // BlocBuilder<TaskCubit, TaskState>(
              //   builder: (context, state) {
              //     if (state is TaskLoading) {
              //       return const CircularProgressIndicator();
              //     } else if (state is TaskCreated) {
              //       return Text('Project Created: ${state.taskData?.name ?? ''}');
              //     } else if (state is TaskError) {
              //       return Text('Error: ${state.error}');
              //     }
              //     return Container();
              //   },
              // ),
              // 10.height,
              // BlocBuilder<ProjectCubit, ProjectState>(
              //   builder: (context, state) {
              //     if (state is ProjectLoading) {
              //       return const Center(child: CircularProgressIndicator());
              //     } else if (state is ProjectsLoaded) {
              //       return Expanded(
              //         child: ListView.builder(
              //           itemCount: state.projects.length,
              //           itemBuilder: (context, index) {
              //             final project = state.projects[index];
              //             return Container(
              //               margin: const EdgeInsets.symmetric(vertical: 10),
              //               child: ProjectComponent(project: project),
              //             );
              //           },
              //         ),
              //       );
              //     } else if (state is ProjectError) {
              //       return Text('Error: ${state.error}');
              //     }
              //     return Container();
              //   },
              // ),
            ],
          ),
        );
      },
    );
  }
}
