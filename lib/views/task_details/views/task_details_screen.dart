import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/cubit/comment_cubit.dart';
import 'package:kanban_board/models/task_model.dart';
import 'package:kanban_board/repositories/comments_repository.dart';
import 'package:kanban_board/utils/extensions.dart';

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
                  Text(
                    'Task Details',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  20.height,
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
                                key: Key(comment.id ?? ''),
                                // Provide a function that tells the app
                                // what to do after an item has been swiped away.
                                onDismissed: (direction) {
                                  // Remove the item from the data source.
                                  // setState(() {
                                  //   items.removeAt(index);
                                  // });
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
