import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/views/dashboard/views/home_screen.dart';
import 'package:kanban_board/views/profile/profile_screen.dart';

class DashboardCubit extends Cubit<int> {
  DashboardCubit() : super(0);

  void changeScreen(int newScreen) {
    // check if index is not out of bounds
    if (newScreen < 0 || newScreen >= screens.length) {
      // inform dev about this error
      log('Index out of bounds: $newScreen');
      return;
    }

    emit(newScreen);
  }

  // list of screens
  static const List<Widget> screens = [
    HomeScreen(),
    ProfileScreen(),
    // Add more screens here
  ];
}
