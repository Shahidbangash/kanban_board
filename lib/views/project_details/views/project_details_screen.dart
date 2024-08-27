import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:kanban_board/const/resource.dart';
import 'package:kanban_board/cubit/section_cubit.dart';
import 'package:kanban_board/cubit/task_cubit.dart';
import 'package:kanban_board/models/project_model.dart';
import 'package:kanban_board/models/section_model.dart';
import 'package:kanban_board/models/task_model.dart';
import 'package:kanban_board/repositories/section_repository.dart';
import 'package:kanban_board/utils/extensions.dart';
import 'package:kanban_board/utils/isar.dart';
import 'package:kanban_board/views/project_details/views/components/task_list_components.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({
    required this.projectId,
    required this.project,
    super.key,
  });

  final String projectId;
  final Project project;

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // isar.
    // sectionCubit.fetchSectionsForProject(widget.projectId).then((_) {
    //   if (sectionCubit.state is SectionsLoaded) {
    //     final state = sectionCubit.state as SectionsLoaded;
    //     if (state.sections != null) {
    //       setState(() {
    //         sections = state.sections!;
    //       });
    //     }
    //   }
    // });
  }

  final sectionCubit = SectionCubit(SectionRepository());

  List<SectionModel> sections = [];
  Map<String, List<TaskModel>> sectionTasks = {}; // Map section ID to tasks

  Isar isar = IsarService().isarInstance;

  // This function handles moving a task from one section to another
  void moveCard({
    required TaskModel task,
    required SectionModel fromSection,
    required SectionModel toSection,
    required TaskCubit taskCubit,
  }) {
    log('Moving task ${task.content} from ${fromSection.name} to ${toSection.name}');

    log('Task ID: ${toSection.id}');
    if (fromSection.id == toSection.id) {
      return;
    }

    taskCubit.onCardMoved(
      task: task,
      fromSection: fromSection,
      toSection: toSection,
    );
  }

  // Function to reorder tasks within a section
  void reorderTask({
    required TaskModel task,
    required int oldIndex,
    required int newIndex,
  }) {
    setState(() {
      final sectionId = task.sectionId;
      final taskList = sectionTasks[sectionId!]!;
      final taskToMove = taskList.removeAt(oldIndex);

      taskList.insert(newIndex, taskToMove);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return sectionCubit..fetchSectionsForProject(widget.projectId);
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            sectionCubit.showAddSectionUi(
              context,
              project: widget.project,
            );
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Project Sections'),
        ),
        body: SizedBox(
          height: context.height,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0E7FF),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFE0E7FF),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFE0E7FF),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 2),
                            ),
                          ],
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF4F46E5),
                              // Color(0xFFE0E7FF),
                              Colors.blue,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    20.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.project.name ?? 'Unnamed Project',
                          // style: context.,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        5.height,
                        // Text('Project Description',
                        // style: context.textTheme.subtitle1),
                      ],
                    ),
                  ],
                ),
                // Expanded(
                //   child: BlocConsumer<SectionCubit, SectionState>(
                //     listener: (context, state) {
                //       if (state is SectionAdded) {
                //         setState(() {
                //           sections.add(state.section);
                //         });
                //       }
                //     },
                //     builder: (context, state) {
                //       if (state is SectionLoading) {
                //         return const Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Center(child: CircularProgressIndicator()),
                //           ],
                //         );
                //       } else if (state is SectionsLoaded) {
                //         if (state.sections!.isEmpty) {
                //           return InkWell(
                //             onTap: () =>
                //                 context.read<SectionCubit>().showAddSectionUi(
                //                       context,
                //                       project: widget.project,
                //                     ),
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Image.asset(R.ASSETS_NO_TASK_ICON_PNG),
                //                 20.height,
                //                 Text(
                //                   'No sections found for this project',
                //                   style: Theme.of(context).textTheme.titleSmall,
                //                 ),
                //               ],
                //             ),
                //           );
                //         }

                //         return SingleChildScrollView(
                //           scrollDirection: Axis.horizontal,
                //           child: Row(
                //             children: List.generate(sections.length, (index) {
                //               return TaskListComponent(
                //                 project: widget.project,
                //                 section: sections[index],
                //                 onCardMoved: moveCard,
                //                 // onTaskReordered: reorderTask,
                //               );
                //             }),
                //           ),
                //         );
                //       } else if (state is SectionError) {
                //         return Center(child: Text('Error: ${state.error}'));
                //       }
                //       return Container();
                //     },
                //   ),
                // ),

                Expanded(
                  child: StreamBuilder<List<SectionModel>>(
                    stream: isar.sectionModels
                        .where()
                        .projectIdEqualTo(widget.projectId)
                        .watch(fireImmediately: true),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(child: CircularProgressIndicator()),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return InkWell(
                          onTap: () => (),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(R.ASSETS_NO_TASK_ICON_PNG),
                              20.height,
                              Text(
                                'No sections found for this project',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        );
                      } else {
                        final sections = snapshot.data!;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(sections.length, (index) {
                              return TaskListComponent(
                                project: widget.project,
                                section: sections[index],
                                onCardMoved: moveCard,
                              );
                            }),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
