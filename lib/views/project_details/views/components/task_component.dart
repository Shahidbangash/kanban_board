import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kanban_board/models/task_model.dart';
import 'package:kanban_board/views/task_details/views/task_details_screen.dart';

class TaskComponent extends StatelessWidget {
  const TaskComponent({
    required this.task,
    super.key,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<Widget>(
            builder: (context) {
              return TaskDetailsScreen(task: task);
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color(0xFFFFFFFF),
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
                    task.content ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    // Trigger the creation of a new task using TaskCubit
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              task.description ?? '',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            if (task.labels != null)
              Wrap(
                spacing: 8,
                children: task.labels!
                    .map(
                      (tag) => Chip(
                        label: Text(tag),
                      ),
                    )
                    .toList(),
              ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.calendar_today),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    task.due?.date ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Icon(Icons.comment),
                const SizedBox(width: 8),
                Text(
                  '${task.commentCount ?? 0}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
