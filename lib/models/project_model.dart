import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kanban_board/utils/extensions.dart';

class Project {
  Project({
    this.id,
    this.name,
    this.commentCount,
    this.order,
    this.color,
    this.isShared,
    this.isFavorite,
    this.isInboxProject,
    this.isTeamInbox,
    this.viewStyle,
    this.url,
    this.parentId,
  });
  final String? id;
  final String? name;
  final int? commentCount;
  final int? order;
  final String? color;
  final bool? isShared;
  final bool? isFavorite;
  final bool? isInboxProject;
  final bool? isTeamInbox;
  final String? viewStyle;
  final String? url;
  final String? parentId;

  // Convert the color string to a Flutter Color using the extension
  Color get projectColor {
    return color?.toProjectColor ?? Colors.black;
  }

  /// instead of Factory , we use static to have more control over error handling
  /// Factory constructor always return not nullable object as we know json cannot be trusted
  /// so we have to make sure that we handle the error properly
  /// handle null value, case in caller side
  static Project? fromJson(Map<String, dynamic>? json) {
    try {
      if (json == null) {
        return null;
      }

      return Project(
        id: json['id'] as String?,
        name: json['name'] as String?,
        commentCount: int.tryParse(
          '${json['comment_count']}',
          // this wont cause crash  if wrong data type
        ),
        order: int.tryParse('${json['order']}'),
        color: '${json['color']}',
        isShared: bool.tryParse('${json['is_shared']}'),
        isFavorite: bool.tryParse('${json['is_favorite']}'),
        isInboxProject: bool.tryParse('${json['is_inbox_project']}'),
        isTeamInbox: bool.tryParse('${json['is_team_inbox']}'),
        viewStyle: '${json['view_style']}',
        url: '${json['url']}',
        parentId: '${json['parent_id']}',
      );
    } catch (error, stackTrace) {
      log('Error: $error');
      log('Stack Trace: $stackTrace');
      return null;
    }
  }

  // Method to convert a Project instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'comment_count': commentCount,
      'order': order,
      'color': color,
      'is_shared': isShared,
      'is_favorite': isFavorite,
      'is_inbox_project': isInboxProject,
      'is_team_inbox': isTeamInbox,
      'view_style': viewStyle,
      'url': url,
      'parent_id': parentId,
    };
  }
}
