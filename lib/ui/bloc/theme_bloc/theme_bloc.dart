import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/data/source/local/preferences_management.dart';
import 'package:flutter_intership_onix/ui/themes/dark_theme_data.dart';
import 'package:flutter_intership_onix/ui/themes/light_theme_data.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final PreferencesManagement _preferencesManagement = PreferencesManagement();
  bool isDark = false;

  ThemeData lightTheme = lightThemeData();
  ThemeData darkTheme = darkThemeData();

  ThemeBloc() : super(ThemeInitial()) {
    on<LoadPref>((event, emit) => _loadFromPref(emit));
    on<ChangeTheme>((event, emit) => _changeThemeData(emit));

    add(LoadPref());
  }

  void _loadFromPref(Emitter<ThemeState> emit) async {
    bool? _isDarkPref;
    try {
      _isDarkPref = await _preferencesManagement.getTheme();
      _isDarkPref ??= isDark;
    } catch (_) {
      _preferencesManagement.setThemeInPref(isDark);
      _isDarkPref = isDark;
    }
    if (_isDarkPref != isDark) {
      isDark = _isDarkPref;
    }
    emit(ThemeFirstLoaded());
  }

  void _changeThemeData(Emitter<ThemeState> emit) {
    isDark = !isDark;
    _preferencesManagement.setThemeInPref(isDark);
    emit(ThemeChanged());
  }
}
