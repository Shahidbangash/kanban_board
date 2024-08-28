import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kanban_board/models/activity_model.dart';
import 'package:kanban_board/utils/activity_services.dart';
import 'package:kanban_board/utils/extensions.dart';

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
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  title: Text(
                    activity.description ?? 'No description provided',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  contentPadding: const EdgeInsets.all(8),
                  subtitle: Text(
                    "${DateFormat(
                      'dd MMM yyyy, hh:mm a',
                    ).format(activity.dateTime ?? DateTime.now())} (${activity.dateTime?.timeAgo(context)})",
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
