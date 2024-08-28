import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kanban_board/models/project_model.dart';
import 'package:kanban_board/models/section_model.dart';
import 'package:kanban_board/repositories/section_repository.dart';
import 'package:kanban_board/utils/middleware.dart';
import 'package:kanban_board/views/project_details/views/components/add_section_ui.dart';
// import 'section_repository.dart';

// States for SectionCubit
abstract class SectionState extends Equatable {
  const SectionState();

  @override
  List<Object?> get props => [];
}

class SectionInitial extends SectionState {}

class SectionLoading extends SectionState {}

class SectionAdded extends SectionState {
  const SectionAdded(this.section);
  final SectionModel section;

  @override
  List<Object?> get props => [section];
}

class SectionUpdated extends SectionState {
  const SectionUpdated(this.section);
  final SectionModel section;

  @override
  List<Object?> get props => [section];
}

class SectionError extends SectionState {
  const SectionError(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}

class SectionsLoaded extends SectionState {
  const SectionsLoaded(this.sections);
  final List<SectionModel>? sections;

  @override
  List<Object?> get props => [sections];
}

class SectionDeleted extends SectionState {
  const SectionDeleted(this.sectionId);
  final String sectionId;

  @override
  List<Object?> get props => [sectionId];
}

// SectionCubit Class
class SectionCubit extends Cubit<SectionState> {
  SectionCubit(this.sectionRepository) : super(SectionInitial());
  final SectionRepository sectionRepository;

  /// Method to fetch sections for a specific project
  Future<void> fetchSectionsForProject(String projectId) async {
    try {
      emit(SectionLoading());

      final sections = await sectionRepository.getSectionsForProject(projectId);

      emit(SectionsLoaded(sections ?? []));
    } catch (error, stackTrace) {
      log('Error: at `fetchSectionsForProject` $error');
      log('Stack Trace: $stackTrace');
      emit(SectionError(error.toString()));
    }
  }

  // Add a new section
  Future<void> addSection(String projectId, String sectionName) async {
    try {
      emit(SectionLoading());

      final section =
          await sectionRepository.addSection(projectId, sectionName);

      if (section != null) {
        await SyncMiddleware().syncLocalWithRemoteSections([section]);

        emit(SectionAdded(section));
        // await fetchSectionsForProject(
        //   projectId,
        // ); // Re-fetch sections to update the list
      } else {
        emit(const SectionError('Failed to add section'));
      }
    } catch (e) {
      emit(SectionError(e.toString()));
    }
  }

  // Update an existing section
  Future<void> updateSection(String sectionId, String updatedName) async {
    try {
      emit(SectionLoading());

      final section =
          await sectionRepository.updateSection(sectionId, updatedName);

      if (section != null) {
        emit(SectionUpdated(section));
      } else {
        emit(const SectionError('Failed to update section'));
      }
    } catch (e) {
      emit(SectionError(e.toString()));
    }
  }

  // Method to delete a section by ID
  Future<void> deleteSection(String sectionId, String projectId) async {
    try {
      emit(SectionLoading());

      final success = await sectionRepository.deleteSection(sectionId);

      if (success) {
        await SyncMiddleware().deleteSection(sectionId);

        emit(SectionDeleted(sectionId));

        // await fetchSectionsForProject(
        //   projectId,
        // ); // Re-fetch sections after deletion
      } else {
        emit(const SectionError('Failed to delete section.'));
      }
    } catch (e) {
      emit(SectionError(e.toString()));
    }
  }

  /// show Ui for Adding Section
  void showAddSectionUi(
    BuildContext context, {
    required Project project,
  }) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) =>
          AddSectionForm(project: project, sectionCubit: this),
    );
  }
}
