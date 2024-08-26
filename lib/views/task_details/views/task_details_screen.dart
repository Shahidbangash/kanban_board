import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/cubit/comment_cubit.dart';
import 'package:kanban_board/models/task_model.dart';
import 'package:kanban_board/repositories/comments_repository.dart';
import 'package:kanban_board/utils/extensions.dart';
import 'package:kanban_board/views/task_details/components/task_details.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({required this.task, super.key});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    final contentController = TextEditingController();
    final commentCubit = CommentCubit(
      CommentRepository(),
    )..fetchComments(task.id ?? '');
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
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  10.height,
                  CommonKeyValueRowWidget(
                    title: 'Task Id',
                    value: task.id ?? 'No content',
                  ),
                  10.height,
                  CommonKeyValueRowWidget(
                    title: 'Content',
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
                    title: 'Priority Level',
                    value: 'P${task.priority}',
                  ),
                  20.height,
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Content',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Divider(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<CommentCubit, CommentState>(
                      builder: (context, state) {
                        if (state is CommentLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is CommentLoaded) {
                          if (state.comments.isEmpty) {
                            return const Center(child: Text('No comments'));
                          }
                          return ListView.builder(
                            itemCount: state.comments.length,
                            itemBuilder: (context, index) {
                              final comment = state.comments[index];
                              if (comment == null) {
                                return const ListTile(
                                  title: Text('Error loading comment'),
                                );
                              }
                              return Dismissible(
                                // Each Dismissible must contain a Key. Keys allow Flutter to
                                // uniquely identify widgets.
                                key: Key(comment.id ?? UniqueKey().toString()),
                                // Provide a function that tells the app
                                // what to do after an item has been swiped away.
                                onDismissed: (direction) {
                                  // Remove the item from the data source.

                                  commentCubit.deleteComment(
                                    comment.id ?? '',
                                    task.id ?? '',
                                  );

                                  // Then show a snackbar.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('${comment.id} dismissed'),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  title: Text(comment.content ?? 'No content'),
                                  subtitle: Text(
                                    'Posted at: ${comment.postedAt?.toIso8601String() ?? 'Unknown'}',
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (state is CommentError) {
                          return Center(child: Text('Error: ${state.error}'));
                        }
                        return Container();
                      },
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
                  10.height,
                ],
              ),
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
