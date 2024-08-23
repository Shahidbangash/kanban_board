import 'dart:developer';
import 'package:kanban_board/models/sections_model.dart';
import 'package:kanban_board/utils/network_utils.dart';

class SectionRepository {
  /// get all sections from Api
  ///   // Fetch sections for a specific project
  Future<List<Section>?> getSectionsForProject(String projectId) async {
    try {
      final response = await buildHttpResponse(
        endPoint:
            'sections?project_id=$projectId', // Endpoint for fetching sections of a project
        // method: HttpMethod.get,
      );

      final data = await handleResponse(response);

      if (data is Map && data.containsKey('error')) {
        throw Exception(data['message']);
      }
      if (data is List) {
        // Convert JSON to a list of Section objects using Section.fromJson
        return List<Section>.from(
          data
              .map(
                (sectionJson) =>
                    Section.fromJson(sectionJson as Map<String, dynamic>?),
              )
              .where((element) => element != null)
              .cast<Section>()
              .toList(),
        );
      }
      return null;
    } catch (error, stackTrace) {
      log('Error: at `getSectionsForProject` $error');
      log('Stack Trace: $stackTrace');
      return null;
    }
  }

  /// Add a new section to a specific project
  Future<Section?> addSection(String projectId, String sectionName) async {
    try {
      final response = await buildHttpResponse(
        endPoint: 'sections', // Endpoint for adding a section
        method: HttpMethod.post,
        request: {
          'project_id': projectId,
          'name': sectionName,
        },
      );

      final data = await handleResponse(response);

      if (data is Map && data.containsKey('error')) {
        throw Exception(data['message']);
      }

      return Section.fromJson(data as Map<String, dynamic>?);
    } catch (error, stackTrace) {
      log('Error at `addSection`: $error');
      log('Stack Trace: $stackTrace');
      return null;
    }
  }

  /// Update an existing section
  Future<Section?> updateSection(String sectionId, String updatedName) async {
    try {
      final response = await buildHttpResponse(
        endPoint: 'sections/$sectionId', // Endpoint for updating a section
        method: HttpMethod.post,
        request: {
          'name': updatedName,
        },
      );

      final data = await handleResponse(response);

      if (data is Map && data.containsKey('error')) {
        throw Exception(data['message']);
      }

      return Section.fromJson(data as Map<String, dynamic>?);
    } catch (error, stackTrace) {
      log('Error at `updateSection`: $error');
      log('Stack Trace: $stackTrace');
      return null;
    }
  }

  /// Delete a section by section ID
  Future<bool> deleteSection(String sectionId) async {
    try {
      final response = await buildHttpResponse(
        endPoint: 'sections/$sectionId', // Endpoint for deleting a section
        method: HttpMethod.delete,
      );

      if (response.statusCode == 204) {
        // Section deleted successfully
        return true;
      } else {
        return false;
      }
    } catch (error, stackTrace) {
      log('Error at `deleteSection`: $error');
      log('Stack Trace: $stackTrace');
      return false;
    }
  }
}
