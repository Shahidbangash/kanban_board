import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en')); // Default to English

  // Method to change the locale
  void changeLocale(String languageCode) {
    emit(Locale(languageCode));
  }
}
