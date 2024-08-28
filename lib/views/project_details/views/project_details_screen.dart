import 'dart:developer';
import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
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
import 'package:kanban_board/views/history/view/activity_history_screen.dart';
import 'package:kanban_board/views/project_details/views/components/task_component.dart';

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
  late AppFlowyBoardController controller;

  late AppFlowyBoardScrollController boardController;
  final sectionCubit = SectionCubit(SectionRepository());
  Isar isar = IsarService().isarInstance;

  // Define sectionTasks map
  Map<String, List<TaskModel>> sectionTasks = {}; // Map section ID to tasks

  @override
  void initState() {
    super.initState();
    controller = initBoardController();
    boardController = AppFlowyBoardScrollController();
  }

  AppFlowyBoardController initBoardController() {
    return AppFlowyBoardController(
      onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
        log('Moved group from $fromIndex to $toIndex');
      },
      onMoveGroupItem: (groupId, fromIndex, toIndex) {
        log('Moved $groupId:$fromIndex to $groupId:$toIndex');
      },
      onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
        log('Moved $fromGroupId:$fromIndex to $toGroupId:$toIndex');

        final task = sectionTasks[fromGroupId]?[fromIndex];

        if (task == null) {
          return;
        }
        final fromSection = IsarService()
            .isarInstance
            .sectionModels
            .where()
            .idEqualTo(fromGroupId)
            .findFirst();

        if (fromSection == null) {
          return;
        }
        final toSection = IsarService()
            .isarInstance
            .sectionModels
            .where()
            .idEqualTo(toGroupId)
            .findFirst();

        if (toSection == null) {
          return;
        }

        TaskCubit(TaskRepository()).onCardMoved(
          task: task,
          fromSection: fromSection,
          toSection: toSection,
        );
      },
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

  void _populateBoardWithSections(List<SectionModel> sections) {
    for (final section in sections) {
      controller.removeGroup(section.idFromBackend ?? section.id);
      final taskList = IsarService()
          .isarInstance
          .taskModels
          .where()
          .sectionIdEqualTo(section.id)
          .findAll();
      sectionTasks[section.idFromBackend ?? section.id] = taskList;
      final groupItems = sectionTasks[section.idFromBackend ?? section.id]!
          .map(TextItem.new)
          .toList();

      // ignore: inference_failure_on_instance_creation
      final group = AppFlowyGroupData(
        id: section.idFromBackend ?? section.id,
        name: section.name ?? '',
        items: List<AppFlowyGroupItem>.from(groupItems),
      );
      controller.addGroup(group);
    }

    // controller = initBoardController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          IconButton(
            onPressed: () async {
              await SyncMiddleware().syncSections(widget.projectId);
            },
            icon: const Icon(Icons.sync),
          ),
          10.width,
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await SyncMiddleware().syncSections(widget.projectId);
        },
        child: SizedBox(
          height: context.height,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: StreamBuilder<List<SectionModel>>(
              stream: isar.sectionModels
                  .where()
                  .projectIdEqualTo(widget.projectId)
                  .and()
                  .idIsNotEmpty()
                  .sortByOrder()
                  .build()
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
                  return StreamBuilder(
                    stream: isar.taskModels
                        .where()
                        .projectIdEqualTo(widget.projectId)
                        .build()
                        .watch(fireImmediately: true),
                    builder: (context, data) {
                      final sections = snapshot.data!;
                      _populateBoardWithSections(sections);
                      return _buildAppFlowyBoard();
                    },
                  );
                }
              },
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

          addIcon: MaterialButton(
            padding: EdgeInsets.zero,
            minWidth: 30,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<Widget>(
                  builder: (context) {
                    return ActivityHistoryScreen(
                      // taskId: columnData.id,
                      projectId: widget.projectId,
                    );
                  },
                ),
              );
            },
            child: const Icon(Icons.history),
          ),

          // Add pop menu Button to delete the section
          moreIcon: PopupMenuButton(
            padding: EdgeInsets.zero,
            onSelected: (value) {
              if (value == 'delete') {
                // Trigger the deletion of the section using SectionCubit

                controller.removeGroup(columnData.id);
                SectionCubit(SectionRepository())
                    .deleteSection(columnData.id, widget.projectId);
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
