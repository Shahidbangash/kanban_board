// Helper method to map the ThemeModeState enum to Flutter's ThemeMode
import 'package:flutter/material.dart';
import 'package:kanban_board/cubit/theme_cubit.dart';

ThemeMode mapThemeStateToThemeMode(ThemeModeState themeState) {
  switch (themeState) {
    case ThemeModeState.light:
      return ThemeMode.light;
    case ThemeModeState.dark:
      return ThemeMode.dark;
    case ThemeModeState.system:
      return ThemeMode.system;
  }
}
