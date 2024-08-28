import 'dart:developer';
import 'package:kanban_board/models/project_model.dart';
import 'package:kanban_board/utils/network_utils.dart';

class ProjectRepository {
  // Function to create a new project (task) using the Todoist API
  Future<Project?> createProject(String projectName) async {
    final response = await buildHttpResponse(
      endPoint: 'projects', // Endpoint for creating projects
      method: HttpMethod.post,
      request: {
        'name': projectName, // Request body contains the project name
      },
    );

    // Handle the response and return the decoded result
    final json = await handleResponse(response);

    if (json is Map && json.containsKey('error')) {
      throw Exception(json['message'] ?? 'Something went wrong');
    }

    if (json is Map) {
      return Project.fromJson(json as Map<String, dynamic>);
    }
    return null;
    // return Project.fromJson(json);
  }

  // Function to update a project using the Todoist API
  Future<Project?> updateProject(Project project) async {
    final response = await buildHttpResponse(
      endPoint: 'projects/${project.id}', // Endpoint for updating projects
      method: HttpMethod.post,
      request: project.toJson(), // Request body contains the project data
    );

    // Handle the response and return the decoded result
    final json = await handleResponse(response);

    if (json is Map && json.containsKey('error')) {
      throw Exception(json['message'] ?? 'Something went wrong');
    }

    if (json is Map) {
      return Project.fromJson(json as Map<String, dynamic>);
    }
    return null;
  }

  // Function to get all projects using the Todoist API
  Future<List<Project>?> getAllProjects() async {
    try {
      final response = await buildHttpResponse(
        endPoint: 'projects', // Endpoint for fetching all projects
      );

      // Handle the response and return the list of projects
      final data = await handleResponse(response);

      if (data is Map && data.containsKey('error')) {
        throw Exception(data['message'] ?? 'Something went wrong');
      }

      if (data is List) {
        return data
            .map((e) => Project.fromJson(e as Map<String, dynamic>?))
            .toList()
            .where((element) => element != null)
            .cast<Project>()
            .toList();
      }
      log('Projects: $data');
      return null;
    } catch (error, stackTrace) {
      log('Error: at `buildHttpResponse` $error');
      log('Stack Trace: $stackTrace');
      return null;
    }
  }
}
