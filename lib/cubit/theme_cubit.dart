import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kanban_board/app/app.dart';
import 'package:kanban_board/l10n/l10n.dart';

enum ThemeModeState { light, dark, system }

class ThemeCubit extends Cubit<ThemeModeState> {
  ThemeCubit() : super(ThemeModeState.light);

  // Toggle between light and dark mode
  void toggleTheme(ThemeModeState themeMode) {
    emit(themeMode);
  }

  // check if the current theme is light
  bool get isLightTheme {
    // there will be rare condition where state is using system .
    // so in that we have to confirm the theme from the system
    if (state == ThemeModeState.system) {
      // return true;
      // TODO: handle this case and know the system theme
    }
    return state == ThemeModeState.light;
  }

  // TODO: ADD Offline Mode Functionality for THEME

  // ui dialog to confirm the theme change
  void showThemeChangeDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) {
        final appLocalizations = context.l10n;
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(appLocalizations.lblLight),
                onTap: () {
                  toggleTheme(ThemeModeState.light);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text(appLocalizations.lblDark),
                onTap: () {
                  toggleTheme(ThemeModeState.dark);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text(appLocalizations.lblSystem),
                onTap: () {
                  toggleTheme(ThemeModeState.system);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
