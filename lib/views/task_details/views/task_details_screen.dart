import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/cubit/comment_cubit.dart';
import 'package:kanban_board/models/task_model.dart';
import 'package:kanban_board/repositories/comments_repository.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({required this.task, super.key});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CommentCubit(CommentRepository())..fetchComments(task.id ?? ''),
      child: Scaffold(
        appBar: AppBar(
          title: Text(' ${task.content}'),
        ),
        body: BlocBuilder<CommentCubit, CommentState>(
          builder: (context, state) {
            if (state is CommentLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CommentLoaded) {
              return ListView.builder(
                itemCount: state.comments.length,
                itemBuilder: (context, index) {
                  final comment = state.comments[index];
                  if (comment == null) {
                    return const ListTile(title: Text('Error loading comment'));
                  }
                  return ListTile(
                    title: Text(comment.content ?? 'No content'),
                    subtitle: Text(
                      'Posted at: ${comment.postedAt?.toIso8601String() ?? 'Unknown'}',
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddCommentDialog(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _showAddCommentDialog(BuildContext context) {
    final contentController = TextEditingController();
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Comment'),
          content: TextField(
            controller: contentController,
            decoration:
                const InputDecoration(hintText: 'Enter comment content'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CommentCubit>().createComment({
                  'task_id': task.id,
                  'content': contentController.text,
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
