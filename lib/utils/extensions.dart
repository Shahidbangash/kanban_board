// Helper method to map the ThemeModeState enum to Flutter's ThemeMode
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/cubit/language_cubit.dart';
import 'package:kanban_board/cubit/theme_cubit.dart';
import 'package:kanban_board/views/dashboard/views/home_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

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

extension ProjectColorExtension on String {
  static final Map<String, Color> _colorMap = {
    'berry_red': const Color(0xFFb8256f),
    'red': const Color(0xFFdb4035),
    'orange': const Color(0xFFff9933),
    'yellow': const Color(0xFFfad000),
    'olive_green': const Color(0xFFafb83b),
    'lime_green': const Color(0xFF7ecc49),
    'green': const Color(0xFF299438),
    'mint_green': const Color(0xFF6accbc),
    'teal': const Color(0xFF158fad),
    'sky_blue': const Color(0xFF14aaf5),
    'light_blue': const Color(0xFF96c3eb),
    'blue': const Color(0xFF4073ff),
    'grape': const Color(0xFF884dff),
    'violet': const Color(0xFFaf38eb),
    'lavender': const Color(0xFFeb96eb),
    'magenta': const Color(0xFFe05194),
    'salmon': const Color(0xFFff8d85),
    'charcoal': const Color(0xFF808080),
    'grey': const Color(0xFFb8b8b8),
    'taupe': const Color(0xFFccac93),
  };

  Color get toProjectColor {
    return _colorMap[this] ??
        Colors.black; // Default to black if color not found
  }
}

// extension on DateTime
extension DateTimeExtension on DateTime? {
  String timeAgo(BuildContext context) {
    return timeago.format(
      this ?? DateTime.now(),
      locale: context.read<LanguageCubit>().state.languageCode,
    );
  }
}
