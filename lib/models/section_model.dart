import 'dart:developer';
import 'package:isar/isar.dart';

part 'section_model.g.dart';

@collection
class SectionModel {
  SectionModel({
    this.id = '',
    this.idFromBackend,
    this.projectId,
    this.order,
    this.name,
  });

  String id;
  String? idFromBackend;
  String? projectId;
  int? order;
  String? name;

  /// Static constructor for error handling
  /// Returns `null` if the data cannot be parsed correctly
  static SectionModel? fromJson(Map<String, dynamic>? json) {
    try {
      if (json == null) {
        return null;
      }

      return SectionModel(
        id: '${json['id']}',
        idFromBackend:
            json['id'] as String? ?? json['idFromBackend'] as String?,
        projectId: json['project_id'] as String?,
        order: int.tryParse('${json['order']}'),
        name: json['name'] as String?,
      );
    } catch (error, stackTrace) {
      log('Error in Section.fromJson: $error');
      log('Stack Trace: $stackTrace');
      return null;
    }
  }

  // Method to convert a Section instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'project_id': projectId,
      'order': order,
      'name': name,
      'idFromBackend': idFromBackend,
    };
  }
}
