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

//   extension method for adding height and width to the context

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

extension IntExtensions on int? {
  /// Validate given int is not null and returns given value if null.
  int validate({int value = 0}) {
    return this ?? value;
  }

  /// Leaves given height of space
  Widget get height => SizedBox(height: this?.toDouble());

  /// Leaves given width of space
  Widget get width => SizedBox(width: this?.toDouble());
}
