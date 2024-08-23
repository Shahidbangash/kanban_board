import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/components/project_components.dart';
import 'package:kanban_board/cubit/language_cubit.dart';
import 'package:kanban_board/cubit/project_cubit.dart';
import 'package:kanban_board/cubit/theme_cubit.dart';
import 'package:kanban_board/l10n/l10n.dart';
import 'package:kanban_board/utils/extensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController projectNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Trigger fetching all projects using TaskCubit
      context.read<ProjectCubit>().fetchAllProjects();
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kanban Dashboard 🃏'),
      ),
      // endDrawer: const EndDrawerButton(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // TextField(
            //   controller: projectNameController,
            //   decoration: const InputDecoration(hintText: 'Enter Project Name'),
            // ),
            // 10.height,
            // ElevatedButton(
            //   onPressed: () {
            //     // Trigger fetching all projects using TaskCubit

            //   },
            //   child: const Text('Get All Projects'),
            // ),
            // 10.height,
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
            BlocBuilder<ProjectCubit, ProjectState>(
              builder: (context, state) {
                if (state is ProjectLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProjectsLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.projects.length,
                      itemBuilder: (context, index) {
                        final project = state.projects[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ProjectComponent(project: project),
                        );
                      },
                    ),
                  );
                } else if (state is ProjectError) {
                  return Text('Error: ${state.error}');
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
