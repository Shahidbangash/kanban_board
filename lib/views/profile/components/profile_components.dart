import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/cubit/theme_cubit.dart';

class ProfileComponents {
  static Widget profileScreenItem(
    BuildContext context, {
    required String title,
    required String imageIcon,
    required VoidCallback onTap,
  }) {
    return MaterialButton(
      onPressed: onTap,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 4,
      ),
      child: Row(
        children: [
          Image.asset(
            imageIcon,
            width: 24,
            height: 24,
            color: context.read<ThemeCubit>().isLightTheme
                ? Colors.black
                : Colors.white,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
