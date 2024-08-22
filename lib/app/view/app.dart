import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/cubit/language_cubit.dart';
import 'package:kanban_board/cubit/theme_cubit.dart';
import 'package:kanban_board/l10n/l10n.dart';
import 'package:kanban_board/theme/app_theme.dart';
import 'package:kanban_board/utils/extensions.dart';
import 'package:kanban_board/views/dashboard/cubit/dashboard_cubit.dart';
import 'package:kanban_board/views/dashboard/views/dashboard_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<LanguageCubit>(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider<DashboardCubit>(
          create: (context) => DashboardCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeModeState>(
        builder: (context, state) {
          return BlocBuilder<LanguageCubit, Locale>(
            builder: (context, localeState) {
              return MaterialApp(
                theme: AppTheme.lightTheme(context),
                darkTheme: AppTheme.darkTheme(context),
                locale: localeState,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                themeMode: mapThemeStateToThemeMode(state),
                home: const DashboardScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
