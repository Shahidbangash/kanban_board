import 'package:bloc/bloc.dart';

enum ThemeModeState { light, dark, system }

class ThemeCubit extends Cubit<ThemeModeState> {
  ThemeCubit() : super(ThemeModeState.system);

  // Toggle between light and dark mode
  void toggleTheme(ThemeModeState themeMode) {
    emit(themeMode);
  }

  // TODO: ADD Offline Mode Functionality for THEME
}
