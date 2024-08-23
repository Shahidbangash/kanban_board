import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/cubit/section_cubit.dart';
import 'package:kanban_board/models/project_model.dart';
import 'package:kanban_board/models/sections_model.dart';

class TaskListComponent extends StatelessWidget {
  const TaskListComponent({
    required this.section,
    required this.project,
    super.key,
  });

  final Section section;
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                onPressed: () {},
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
          // ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: section..length,
          //   itemBuilder: (context, index) {
          //     final task = section.tasks[index];
          //     return Container(
          //       margin: const EdgeInsets.only(bottom: 8),
          //       padding: const EdgeInsets.all(8),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(8),
          //         color: const Color(0xFFE0E7FF),
          //         border: Border.all(color: const Color(0xFFE2E8F0)),
          //         boxShadow: const [
          //           BoxShadow(
          //             color: Color(0xFF171717).withOpacity(0.1),
          //             spreadRadius: -2,
          //             blurRadius: 8,
          //             offset: Offset(0, 4),
          //           ),
          //           BoxShadow(
          //             color: Color(0xFF171717).withOpacity(0.1),
          //             spreadRadius: -2,
          //             blurRadius: 4,
          //             offset: Offset(0, 2),
          //           ),
          //         ],
          //       ),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             task.name,
          //             style: const TextStyle(
          //               fontSize: 16,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //           const SizedBox(height: 8),
          //           Text(
          //             task.description,
          //             style: const TextStyle(
          //               fontSize: 14,
          //             ),
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
