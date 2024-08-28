import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/const/resource.dart';
import 'package:kanban_board/cubit/language_cubit.dart';
import 'package:kanban_board/cubit/theme_cubit.dart';
import 'package:kanban_board/l10n/l10n.dart';
import 'package:kanban_board/utils/extensions.dart';
import 'package:kanban_board/views/profile/components/profile_components.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final appLocations = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocations.lblProfile),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // const SizedBox(height: 20),
            ProfileComponents.profileScreenItem(
              context,
              title: appLocations.lblLanguage,
              imageIcon: R.ASSETS_LANGUAGE_ICON_PNG,
              onTap: () {
                context.read<LanguageCubit>().showLanguageDialog(context);
              },
            ),
            10.width,
            ProfileComponents.profileScreenItem(
              context,
              title: appLocations.lblTheme,
              imageIcon: R.ASSETS_THEME_ICON_PNG,
              onTap: () {
                context.read<ThemeCubit>().showThemeChangeDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
