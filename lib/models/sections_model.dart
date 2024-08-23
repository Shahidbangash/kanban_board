import 'dart:developer';

class Section {
  Section({
    this.id,
    this.projectId,
    this.order,
    this.name,
  });

  final String? id;
  final String? projectId;
  final int? order;
  final String? name;

  /// Static constructor for error handling
  /// Returns `null` if the data cannot be parsed correctly
  static Section? fromJson(Map<String, dynamic>? json) {
    try {
      if (json == null) {
        return null;
      }

      return Section(
        id: json['id'] as String?,
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
    };
  }
}
