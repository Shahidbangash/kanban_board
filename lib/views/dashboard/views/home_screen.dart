import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:kanban_board/components/project_components.dart';
import 'package:kanban_board/cubit/project_cubit.dart';
import 'package:kanban_board/l10n/l10n.dart';
import 'package:kanban_board/models/project_model.dart';
import 'package:kanban_board/utils/isar.dart';
import 'package:kanban_board/utils/middleware.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController projectNameController = TextEditingController();
  Isar isar = IsarService().isarInstance;

  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kanban Dashboard 🃏'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ProjectCubit>().showAddProjectBottomBar(context);
        },
        child: const Icon(Icons.track_changes),
      ),
      // endDrawer: const EndDrawerButton(),
      body: RefreshIndicator(
        onRefresh: () async {
          await SyncMiddleware().syncProjects();
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${appLocalizations.lblProjects} 📂  (${isar.projects.count()})',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),

                  // Toggle Project List View or Grid View
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isListView = !isListView;
                      });
                      // context.read<ProjectCubit>().toggleProjectView();
                    },
                    icon: Icon(isListView ? Icons.grid_view : Icons.list),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              StreamBuilder<List<Project>>(
                stream: isar.projects.where().watch(fireImmediately: true),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final projects = snapshot.data!;
                    if (projects.isEmpty) {
                      return const Center(child: Text('No Projects Available'));
                    }
                    return Expanded(
                      child: isListView
                          ? ListView.builder(
                              itemCount: projects.length,
                              itemBuilder: (context, index) {
                                final project = projects[index];
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: ProjectComponent(project: project),
                                );
                              },
                            )
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: projects.length,
                              itemBuilder: (context, index) {
                                final project = projects[index];
                                return ProjectComponent(project: project);
                              },
                            ),
                    );
                  }
                  return const Center(child: Text('No data'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
