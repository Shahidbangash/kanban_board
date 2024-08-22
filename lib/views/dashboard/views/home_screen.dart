import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/cubit/theme_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
        ],
      ),
      endDrawer: const EndDrawerButton(),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
