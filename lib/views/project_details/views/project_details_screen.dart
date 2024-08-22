import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({required this.projectId, super.key});

  final String projectId;

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Details'),
      ),
    );
  }
}
