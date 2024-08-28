import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en')); // Default to English

  // Method to change the locale
  void changeLocale(String languageCode) {
    emit(Locale(languageCode));
  }

  // build dialog to select language and change locale
  void showLanguageDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('English'),
                onTap: () {
                  changeLocale('en');
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Spanish'),
                onTap: () {
                  changeLocale('es');
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('German'),
                onTap: () {
                  changeLocale('de');
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
