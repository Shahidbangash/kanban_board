import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/const/resource.dart';
import 'package:kanban_board/views/dashboard/cubit/dashboard_cubit.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final DashboardCubit dashboardCubit = DashboardCubit();
    return BlocProvider(
      create: (context) {
        return dashboardCubit;
      },
      child: Scaffold(
        body: BlocBuilder<DashboardCubit, int>(
          builder: (context, state) {
            return IndexedStack(
              index: dashboardCubit.state,
              children: DashboardCubit.screens,
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(R.ASSETS_HOME_ICON_PNG),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(R.ASSETS_PROFILE_ICON_PNG),
              label: 'Profile',
            ),
          ],
          onTap: dashboardCubit.changeScreen,
        ),
      ),
    );
  }
}
