import 'package:flutter/material.dart';
import 'package:kanban_board/views/history/view/activity_history_widget.dart';

class ActivityHistoryScreen extends StatefulWidget {
  const ActivityHistoryScreen({
    super.key,
    this.projectId,
    this.taskId,
  });

  final String? taskId;
  final String? projectId;

  @override
  State<ActivityHistoryScreen> createState() => _ActivityHistoryScreenState();
}

class _ActivityHistoryScreenState extends State<ActivityHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity History'),
      ),
      body: ActivityHistoryWidget(
        taskId: widget.taskId,
        projectId: widget.projectId,
      ),
    );
  }
}
