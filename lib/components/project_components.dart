import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/cubit/theme_cubit.dart';
import 'package:kanban_board/models/project_model.dart';
import 'package:kanban_board/views/dashboard/cubit/dashboard_cubit.dart';
import 'package:kanban_board/views/project_details/views/project_details_screen.dart';
// import 'package:flutter/widgets.dart';

class ProjectComponent extends StatelessWidget {
  const ProjectComponent({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    final isLightTheme = context.read<ThemeCubit>().isLightTheme;
    return GestureDetector(
      onTap: () {
        if (project.idFromBackend == null) {
          return;
        }

        Navigator.push(
          context,
          MaterialPageRoute<Widget>(
            builder: (BuildContext context) {
              return ProjectDetailsScreen(
                projectId: project.idFromBackend ?? project.id,
                project: project,
              );
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: isLightTheme ? Colors.white : const Color(0xFF1E293B),
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
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              project.name ?? '',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isLightTheme ? const Color(0xFF1E293B) : Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              project.id ?? '',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
