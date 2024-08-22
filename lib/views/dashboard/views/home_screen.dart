import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/cubit/language_cubit.dart';
import 'package:kanban_board/cubit/theme_cubit.dart';
import 'package:kanban_board/l10n/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kanban Dashboard 🃏'),
        actions: [
          PopupMenuButton<ThemeModeState>(
            onSelected: (ThemeModeState mode) {
              context.read<ThemeCubit>().toggleTheme(mode);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<ThemeModeState>>[
                const PopupMenuItem<ThemeModeState>(
                  value: ThemeModeState.light,
                  child: Text('Light Mode'),
                ),
                const PopupMenuItem<ThemeModeState>(
                  value: ThemeModeState.dark,
                  child: Text('Dark Mode'),
                ),
                const PopupMenuItem<ThemeModeState>(
                  value: ThemeModeState.system,
                  child: Text('System Default'),
                ),
              ];
            },
          ),
          PopupMenuButton<String>(
            onSelected: (String languageCode) {
              context.read<LanguageCubit>().changeLocale(languageCode);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'en',
                  child: Text('English'),
                ),
                const PopupMenuItem<String>(
                  value: 'es',
                  child: Text('Spanish'),
                ),
                const PopupMenuItem<String>(
                  value: 'de',
                  child: Text('German'),
                ),
              ];
            },
          ),
        ],
      ),
      // endDrawer: const EndDrawerButton(),
      body: Center(
        child: Text(l10n.lblKanbanBoard),
      ),
    );
  }
}
