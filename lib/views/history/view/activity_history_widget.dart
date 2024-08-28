import 'package:flutter/material.dart';
import 'package:kanban_board/models/activity_model.dart';
import 'package:kanban_board/utils/activity_services.dart';

class ActivityHistoryWidget extends StatelessWidget {
  const ActivityHistoryWidget({this.taskId, this.projectId, super.key});
  final String? taskId;
  final String? projectId;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Activity>>(
      stream: ActivityService()
          .watchActivities(taskId: taskId, projectId: projectId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No activity history available'));
        } else {
          final activities = snapshot.data!;
          return ListView.builder(
            itemCount: activities.length,
            itemBuilder: (context, index) {
              final activity = activities[index];
              return ListTile(
                title: Text(activity.description ?? 'No description provided'),
                subtitle: Text(activity.dateTime?.toIso8601String() ?? ''),
              );
            },
          );
        }
      },
    );
  }
}
