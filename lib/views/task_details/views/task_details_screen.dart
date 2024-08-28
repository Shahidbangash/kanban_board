import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:kanban_board/components/task_timer_widget.dart';
import 'package:kanban_board/cubit/comment_cubit.dart';
import 'package:kanban_board/models/task_comment_model.dart';
import 'package:kanban_board/models/task_model.dart';
import 'package:kanban_board/repositories/comments_repository.dart';
import 'package:kanban_board/utils/extensions.dart';
import 'package:kanban_board/utils/isar.dart';
import 'package:kanban_board/views/task_details/components/task_details.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({required this.task, super.key});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    final contentController = TextEditingController();
    final commentCubit = CommentCubit(
      CommentRepository(),
    )..fetchComments(task.idFromBackend ?? task.id);
    return BlocProvider(
      create: (context) {
        return commentCubit;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('${task.content}'),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        10.height,
                        CommonKeyValueRowWidget(
                          title: 'Task Id',
                          value: task.idFromBackend ?? task.id,
                        ),
                        10.height,
                        CommonKeyValueRowWidget(
                          title: 'Name',
                          value: task.content ?? 'No content',
                        ),
                        10.height,
                        CommonKeyValueRowWidget(
                          title: 'Section Id',
                          value: task.sectionId ?? 'No content',
                        ),
                        10.height,
                        CommonKeyValueRowWidget(
                          title: 'Project Id',
                          value: task.projectId ?? 'No content',
                        ),
                        10.height,
                        CommonKeyValueRowWidget(
                          title: 'Is Completed',
                          value: task.projectId ?? 'No content',
                        ),
                        10.height,
                        CommonKeyValueRowWidget(
                          title: 'Priority Level',
                          value: 'P${task.priority}',
                        ),
                        20.height,
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                // alignment: CrossAxisAlignment.start,
                                child: Text(
                                  'Content',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                'Description: ${task.description ?? 'No description'}',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              // const Divider(),
                            ],
                          ),
                        ),
                        20.height,
                        TaskTimerWidget(task: task),
                        10.height,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Comments',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        StreamBuilder<List<Comment>>(
                          stream: IsarService()
                              .isarInstance
                              .comments
                              .where()
                              .taskIdEqualTo(task.idFromBackend ?? task.id)
                              .watch(fireImmediately: true),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            } else if (!snapshot.hasData ||
                                (snapshot.data?.isEmpty ?? false)) {
                              return const Center(
                                child: Text('No comments'),
                              );
                            } else {
                              final comments = snapshot.data!;
                              return Column(
                                // itemCount: comments.length,
                                // itemBuilder: (context, index) {
                                children: comments.map((comment) {
                                  // final comment = comments[index];
                                  return Dismissible(
                                    key: Key(
                                      comment.idFromBackend ?? comment.id,
                                    ),
                                    onDismissed: (direction) async {
                                      // Remove the comment from Isar
                                      await IsarService()
                                          .isarInstance
                                          .write((isar) async {
                                        isar.comments.delete(comment.id);
                                      });

                                      if (context.mounted) {
                                        // Then show a snackbar
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '${comment.id} Removed',
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    child: ListTile(
                                      title: Text(
                                        comment.content ?? 'No content',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontSize: 20,
                                            ),
                                      ),
                                      subtitle: Text(
                                        'Posted at: ${comment.postedAt?.toIso8601String() ?? 'Unknown'}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontSize: 16,
                                            ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            }
                          },
                        ),
                        10.height,
                      ],
                    ),
                  ),
                ),
                TextFormField(
                  controller: contentController,
                  decoration: InputDecoration(
                    hintText: 'Add Comment Here',
                    suffixIcon: MaterialButton(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      minWidth: 30,
                      onPressed: () {
                        if (contentController.text.isNotEmpty) {
                          commentCubit.createComment({
                            'task_id': task.id,
                            'content': contentController.text,
                            'project_id': task.projectId,
                          });
                          contentController.clear();
                        }
                      },
                      child: const Icon(Icons.send),
                    ),
                  ),
                ),
                40.height,
              ],
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     _showAddCommentDialog(context);
        //   },
        //   child: const Icon(Icons.add),
        // ),
      ),
    );
  }
}
