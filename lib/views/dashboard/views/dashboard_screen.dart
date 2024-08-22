import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/const/resource.dart';
import 'package:kanban_board/l10n/l10n.dart';
import 'package:kanban_board/theme/colors.dart';
import 'package:kanban_board/views/dashboard/cubit/dashboard_cubit.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<DashboardCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state,
            children: DashboardCubit.screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  R.ASSETS_HOME_ICON_PNG,
                  color: state == 0 ? primaryColor : Colors.grey,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  R.ASSETS_PROFILE_ICON_PNG,
                  color: state == 1 ? primaryColor : Colors.grey,
                ),
                label: l10n.lblProfile,
              ),
            ],
            onTap: (index) =>
                context.read<DashboardCubit>().changeScreen(index),
          ),
        );
      },
    );
  }
}
