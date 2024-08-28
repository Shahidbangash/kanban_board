import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kanban_board/cubit/section_cubit.dart';
import 'package:kanban_board/l10n/l10n.dart';
import 'package:kanban_board/models/project_model.dart';

class AddSectionForm extends StatelessWidget {
  AddSectionForm({
    required this.project,
    required this.sectionCubit,
    super.key,
  });
  final Project project;
  final TextEditingController _sectionNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SectionCubit sectionCubit;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${appLocalizations.lblAddSection} ${appLocalizations.lblTo} ${project.name}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _sectionNameController,
              decoration: InputDecoration(
                hintText: appLocalizations.lblSectionName,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return appLocalizations.lblPleaseEnterSectionName;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  if (project.idFromBackend == null) {
                    log('Project ID is null');
                    return;
                  }
                  sectionCubit.addSection(
                    project.idFromBackend ?? project.id,
                    _sectionNameController.text,
                  );
                }

                Navigator.pop(context);
              },
              child: Text(appLocalizations.lblAddSection),
            ),
          ],
        ),
      ),
    );
  }
}
