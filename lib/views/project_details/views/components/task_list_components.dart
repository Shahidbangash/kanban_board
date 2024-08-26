import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/cubit/section_cubit.dart';
import 'package:kanban_board/cubit/task_cubit.dart';
import 'package:kanban_board/models/project_model.dart';
import 'package:kanban_board/models/sections_model.dart';
import 'package:kanban_board/models/task_model.dart';
import 'package:kanban_board/repositories/task_repository.dart';
import 'package:kanban_board/views/project_details/views/components/task_component.dart';

class TaskListComponent extends StatelessWidget {
  const TaskListComponent({
    required this.section,
    required this.project,
    required this.onCardMoved,
    super.key,
  });

  final Section section;
  final Project project;
  final void Function({
    required TaskModel task,
    required Section fromSection,
    required Section toSection,
    required TaskCubit taskCubit,
  }) onCardMoved;

  @override
  Widget build(BuildContext context) {
    final taskCubit = TaskCubit(TaskRepository());
    return Container(
      width: 300,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xFFE0E7FF),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF171717).withOpacity(0.1),
            spreadRadius: -2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: const Color(0xFF171717).withOpacity(0.1),
            spreadRadius: -2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  section.name ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  // Trigger the creation of a new task using TaskCubit

                  //  context.read<TaskCubit>().showAddTaskDialog(context, sectionId, projectId)
                  taskCubit.showAddTaskDialog(
                    context,
                    section.id!,
                    project.id!,
                  );
                },
                padding: const EdgeInsets.all(4),
                child: const Text(
                  'Add Task',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4F46E5),
                  ),
                ),
              ),
              // Add pop menu Button to delete the section
              PopupMenuButton(
                onSelected: (value) {
                  if (value == 'delete') {
                    // Trigger the deletion of the section using SectionCubit
                    context.read<SectionCubit>().deleteSection(
                          section.id!,
                          project.id!,
                        );
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
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocProvider(
              create: (context) {
                return taskCubit
                  ..fetchActiveTasks(
                    sectionId: section.id,
                    projectId: project.id,
                  );
              },
              child: BlocConsumer<TaskCubit, TaskState>(
                listener: (context, state) {
                  if (state is TaskError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                      ),
                    );
                  }

                  if (state is TaskCreated) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Task added successfully'),
                      ),
                    );
                  }
                },
                buildWhen: (_, state) => state is! TaskCreated,
                builder: (context, state) {
                  if (state is TaskLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is TaskLoaded) {
                    final tasks = state.tasks;
                    return DragTarget<(TaskModel, Section, Section)>(
                      onAcceptWithDetails: (
                        DragTargetDetails<(TaskModel, Section, Section)>
                            details,
                      ) {
                        // final receivedTask = details.data;
                        onCardMoved(
                          task: details.data.$1,
                          fromSection: details.data.$3,
                          toSection: section,
                          taskCubit: taskCubit,
                        );
                      },
                      builder: (
                        BuildContext context,
                        List<(TaskModel, Section, Section)?> candidateData,
                        rejectedData,
                      ) {
                        return ReorderableListView.builder(
                          primary: true,
                          onReorder: (oldIndex, newIndex) {
                            if (tasks == null) {
                              return;
                            }

                            final taskToMove = tasks.removeAt(oldIndex);
                            tasks.insert(newIndex, taskToMove);
                          },
                          itemCount: tasks?.length ?? 0,
                          itemBuilder: (context, index) {
                            final task = state.tasks?[index];

                            if (task == null) {
                              return const SizedBox.shrink();
                            }

                            return Draggable<(TaskModel, Section, Section)>(
                              key: Key(task.id.toString()),
                              data: (task, section, section),
                              feedback: Material(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  color: Colors.blue,
                                  child: Text(
                                    task.content ?? '',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              childWhenDragging: const SizedBox.shrink(),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: TaskComponent(
                                  task: task,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else if (state is TaskError) {
                    return Center(child: Text('Error: ${state.error}'));
                  }
                  return Container();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
