// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:isar/isar.dart';
// import 'package:kanban_board/const/resource.dart';
// import 'package:kanban_board/cubit/section_cubit.dart';
// import 'package:kanban_board/cubit/task_cubit.dart';
// import 'package:kanban_board/models/project_model.dart';
// import 'package:kanban_board/models/section_model.dart';
// import 'package:kanban_board/models/task_model.dart';
// import 'package:kanban_board/repositories/section_repository.dart';
// import 'package:kanban_board/utils/extensions.dart';
// import 'package:kanban_board/utils/isar.dart';
// import 'package:kanban_board/utils/middleware.dart';
// import 'package:kanban_board/views/project_details/views/components/task_list_components.dart';

// class ProjectDetailsScreen extends StatefulWidget {
//   const ProjectDetailsScreen({
//     required this.projectId,
//     required this.project,
//     super.key,
//   });

//   final String projectId;
//   final Project project;

//   @override
//   State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
// }

// class _ProjectDetailsScreenState extends State<ProjectDetailsScreen>
//     with TickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//   }

//   final sectionCubit = SectionCubit(SectionRepository());

//   List<SectionModel> sections = [];
//   Map<String, List<TaskModel>> sectionTasks = {}; // Map section ID to tasks

//   Isar isar = IsarService().isarInstance;

//   // This function handles moving a task from one section to another
//   void moveCard({
//     required TaskModel task,
//     required SectionModel fromSection,
//     required SectionModel toSection,
//     required TaskCubit taskCubit,
//   }) {
//     log('Moving task ${task.content} from ${fromSection.name} to ${toSection.name}');

//     log('Task ID: ${toSection.id}');
//     if (fromSection.id == toSection.id) {
//       return;
//     }

//     taskCubit.onCardMoved(
//       task: task,
//       fromSection: fromSection,
//       toSection: toSection,
//     );
//   }

//   // Function to reorder tasks within a section
//   void reorderTask({
//     required TaskModel task,
//     required int oldIndex,
//     required int newIndex,
//   }) {
//     setState(() {
//       final sectionId = task.sectionId;
//       final taskList = sectionTasks[sectionId!]!;
//       final taskToMove = taskList.removeAt(oldIndex);

//       taskList.insert(newIndex, taskToMove);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) {
//         return sectionCubit..fetchSectionsForProject(widget.projectId);
//       },
//       child: Scaffold(
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             sectionCubit.showAddSectionUi(
//               context,
//               project: widget.project,
//             );
//           },
//           child: const Icon(Icons.add),
//         ),
//         appBar: AppBar(
//           title: const Text('Project Sections'),
//         ),
//         body: RefreshIndicator(
//           onRefresh: () async {
//             await SyncMiddleware(isar: isar).syncSections(widget.projectId);
//           },
//           child: SizedBox(
//             height: context.height,
//             child: Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         width: 70,
//                         height: 70,
//                         decoration: BoxDecoration(
//                           color: const Color(0xFFE0E7FF),
//                           borderRadius: BorderRadius.circular(50),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Color(0xFFE0E7FF),
//                               spreadRadius: 1,
//                               blurRadius: 2,
//                               offset: Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         padding: const EdgeInsets.all(8),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             boxShadow: const [
//                               BoxShadow(
//                                 color: Color(0xFFE0E7FF),
//                                 spreadRadius: 1,
//                                 blurRadius: 2,
//                                 offset: Offset(0, 2),
//                               ),
//                             ],
//                             gradient: const LinearGradient(
//                               colors: [
//                                 Color(0xFF4F46E5),
//                                 // Color(0xFFE0E7FF),
//                                 Colors.blue,
//                               ],
//                             ),
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                         ),
//                       ),
//                       20.width,
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.project.name ?? 'Unnamed Project',
//                             // style: context.,
//                             style: Theme.of(context).textTheme.titleLarge,
//                           ),
//                           5.height,
//                           // Text('Project Description',
//                           // style: context.textTheme.subtitle1),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Expanded(
//                     child: StreamBuilder<List<SectionModel>>(
//                       stream: isar.sectionModels
//                           .where()
//                           .projectIdEqualTo(widget.projectId)
//                           .watch(fireImmediately: true),
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return const Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Center(child: CircularProgressIndicator()),
//                             ],
//                           );
//                         } else if (snapshot.hasError) {
//                           return Center(
//                             child: Text('Error: ${snapshot.error}'),
//                           );
//                         } else if (!snapshot.hasData ||
//                             snapshot.data!.isEmpty) {
//                           return InkWell(
//                             onTap: () => (),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(R.ASSETS_NO_TASK_ICON_PNG),
//                                 20.height,
//                                 Text(
//                                   'No sections found for this project',
//                                   style: Theme.of(context).textTheme.titleSmall,
//                                 ),
//                               ],
//                             ),
//                           );
//                         } else {
//                           final sections = snapshot.data!;
//                           return SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: Row(
//                               children: List.generate(sections.length, (index) {
//                                 return TaskListComponent(
//                                   project: widget.project,
//                                   section: sections[index],
//                                   onCardMoved: moveCard,
//                                 );
//                               }),
//                             ),
//                           );
//                         }
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

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
import 'package:kanban_board/repositories/task_repository.dart';
import 'package:kanban_board/utils/extensions.dart';
import 'package:kanban_board/utils/isar.dart';
import 'package:kanban_board/utils/middleware.dart';
import 'package:kanban_board/views/project_details/views/components/task_component.dart';
import 'package:kanban_board/views/project_details/views/components/task_list_components.dart';
import 'package:appflowy_board/appflowy_board.dart';

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

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  final AppFlowyBoardController controller = AppFlowyBoardController(
    onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      log('Moved group from $fromIndex to $toIndex');
    },
    onMoveGroupItem: (groupId, fromIndex, toIndex) {
      log('Moved $groupId:$fromIndex to $groupId:$toIndex');
    },
    onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      log('Moved $fromGroupId:$fromIndex to $toGroupId:$toIndex');
    },
  );

  late AppFlowyBoardScrollController boardController;
  final sectionCubit = SectionCubit(SectionRepository());
  Isar isar = IsarService().isarInstance;

  // Define sectionTasks map
  Map<String, List<TaskModel>> sectionTasks = {}; // Map section ID to tasks

  @override
  void initState() {
    super.initState();
    boardController = AppFlowyBoardScrollController();
  }

  // This function handles moving a task from one section to another
  // void moveCard({
  //   required TaskModel task,
  //   required SectionModel fromSection,
  //   required SectionModel toSection,
  //   required TaskCubit taskCubit,
  // }) {
  //   log('Moving task ${task.content} from ${fromSection.name} to ${toSection.name}');

  //   if (fromSection.id == toSection.id) {
  //     return;
  //   }

  //   taskCubit.onCardMoved(
  //     task: task,
  //     fromSection: fromSection,
  //     toSection: toSection,
  //   );
  // }

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

  void _populateBoardWithSections(List<SectionModel> sections) {
    for (final section in sections) {
      sectionTasks[section.idFromBackend ?? section.id] = IsarService()
          .isarInstance
          .taskModels
          .where()
          .sectionIdEqualTo(section.id)
          .findAll();
      final groupItems = sectionTasks[section.idFromBackend ?? section.id]!
          .map(TextItem.new)
          .toList();

      final group = AppFlowyGroupData(
        id: section.idFromBackend ?? section.id,
        name: section.name ?? '',
        items: List<AppFlowyGroupItem>.from(groupItems),
      );
      controller.addGroup(group);
    }
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
        body: RefreshIndicator(
          onRefresh: () async {
            await SyncMiddleware(isar: isar).syncSections(widget.projectId);
          },
          child: SizedBox(
            height: context.height,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: StreamBuilder<List<SectionModel>>(
                stream: isar.sectionModels
                    .where()
                    .projectIdEqualTo(widget.projectId)
                    .watch(fireImmediately: true),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return InkWell(
                      onTap: () => sectionCubit.showAddSectionUi(
                        context,
                        project: widget.project,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(R.ASSETS_NO_TASK_ICON_PNG),
                          const SizedBox(height: 20),
                          Text(
                            'No sections found for this project',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    );
                  } else {
                    final sections = snapshot.data!;
                    _populateBoardWithSections(sections);
                    return _buildAppFlowyBoard();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppFlowyBoard() {
    const config = AppFlowyBoardConfig(
      groupBackgroundColor: Color(0xFFE0E7FF),
      boardCornerRadius: 14,
    );
    return AppFlowyBoard(
      controller: controller,
      boardScrollController: boardController,
      cardBuilder: (
        BuildContext context,
        group,
        AppFlowyGroupItem groupItem,
      ) {
        return AppFlowyGroupCard(
          key: ValueKey(groupItem.id),
          margin: EdgeInsets.zero,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: _buildCard(groupItem),
        );
      },
      headerBuilder: (context, columnData) {
        return AppFlowyGroupHeader(
          icon: const Icon(Icons.lightbulb_circle),
          title: Expanded(
            child: Text(columnData.headerData.groupName),
          ),

          // addIcon: MaterialButton(
          //   onPressed: () {
          //     // Trigger the creation of a new task using TaskCubit

          //     TaskCubit(TaskRepository()).showAddTaskDialog(
          //       context,
          //       columnData.id,
          //       widget.projectId,
          //     );
          //     // taskCubit.showAddTaskDialog(
          //     //   context,
          //     //   section.idFromBackend ?? section.id,
          //     //   project.idFromBackend ?? project.id,
          //     // );
          //   },
          //   padding: EdgeInsets.zero,
          //   child: const Text(
          //     'Add Task',
          //     style: TextStyle(
          //       fontSize: 14,
          //       color: Color(0xFF4F46E5),
          //     ),
          //   ),
          // ),
          // Add pop menu Button to delete the section
          moreIcon: PopupMenuButton(
            padding: EdgeInsets.zero,
            onSelected: (value) {
              if (value == 'delete') {
                // Trigger the deletion of the section using SectionCubit
                // context.read<SectionCubit>().deleteSection(
                //       section.idFromBackend ?? section.id,
                //       project.idFromBackend ?? project.id,
                //     );
              }
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete Section'),
                ),
              ];
            },
          ),

          // moreIcon: const Icon(Icons.more_vert, size: 20),
          // height: 50,

          margin: const EdgeInsets.all(8),
        );
      },
      footerBuilder: (context, columnData) {
        return AppFlowyGroupFooter(
          icon: const Icon(Icons.add, size: 20),
          title: const Text('Add Task'),
          height: 50,
          margin: const EdgeInsets.all(8),
          onAddButtonClick: () {
            boardController.scrollToBottom(columnData.id);

            // Trigger the creation of a new task using TaskCubit

            TaskCubit(TaskRepository()).showAddTaskDialog(
              context,
              columnData.id,
              widget.projectId,
            );
            // taskCubit.showAddTaskDialog(
            //   context,
            //   section.idFromBackend ?? section.id,
            //   project.idFromBackend ?? project.id,
            // );
          },
        );
      },
      groupConstraints: BoxConstraints.tightFor(
        width: MediaQuery.of(context).size.width * 0.69,
      ),
      config: config,
    );
  }

  Widget _buildCard(AppFlowyGroupItem item) {
    if (item is TextItem) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TaskComponent(task: item.taskModel),
      );
    }

    throw UnimplementedError('Unknown item type: $item');
  }
}

class TextItem extends AppFlowyGroupItem {
  TextItem(this.taskModel);
  final TaskModel taskModel;

  @override
  String get id => taskModel.idFromBackend ?? taskModel.id;
}
