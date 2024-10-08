import 'package:flutter/material.dart';
import 'package:kanban_board/l10n/l10n.dart';
import 'package:kanban_board/views/activity/components/activity_history_widget.dart';

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
    final appLocalizations = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.lblActivityHistory),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        // margin: const EdgeInsets.only(bottom: 10),
        child: ActivityHistoryWidget(
          taskId: widget.taskId,
          projectId: widget.projectId,
        ),
      ),
    );
  }
}
