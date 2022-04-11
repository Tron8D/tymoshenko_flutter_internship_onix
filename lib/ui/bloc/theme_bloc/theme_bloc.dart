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
    on<ThemeLoadPref>((event, emit) => _loadFromPref(emit));
    on<ThemePrefLoaded>((event, emit) => _themePrefLoaded(emit));
    on<ChangeTheme>((event, emit) => _changeThemeData(emit));

    add(ThemeLoadPref());
  }

  void _loadFromPref(Emitter<ThemeState> emit) async {
    print('theme pref');
    bool? _isDarkPref;
    try {
      _isDarkPref = await _preferencesManagement.getTheme();
      print('_isDarkPref: $_isDarkPref');
      _isDarkPref ??= isDark;
    } catch (_) {
      _preferencesManagement.setThemeInPref(isDark);
      _isDarkPref = isDark;
    }
    if (_isDarkPref != isDark) {
      isDark = _isDarkPref;
      print('isDark: $isDark');
    }
    emit(ThemeFirstLoaded());
  }

  void _themePrefLoaded(Emitter emit) {
    emit(ThemeLoaded(isDark: isDark));
  }

  void _changeThemeData(Emitter<ThemeState> emit) {
    isDark = !isDark;
    _preferencesManagement.setThemeInPref(isDark);
    print('isDarkPrefSave: $isDark');
    emit(ThemeLoaded(isDark: isDark));
  }
}
