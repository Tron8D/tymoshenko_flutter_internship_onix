import 'package:flutter/material.dart';

import 'package:flutter_intership_onix/data/source/local/preferences_management.dart';
import 'package:flutter_intership_onix/ui/themes/dark_theme_data.dart';
import 'package:flutter_intership_onix/ui/themes/light_theme_data.dart';

class ThemeProvider extends ChangeNotifier {
  final PreferencesManagement _preferencesManagement = PreferencesManagement();
  bool isDark = false;
  ThemeMode userThemeMode = ThemeMode.light;

  ThemeData lightTheme = lightThemeData();
  ThemeData darkTheme = darkThemeData();

  ThemeProvider() {
    _loadFromPref();
  }

  void _loadFromPref() async {
    bool? _isDarkPref;
    try {
      _isDarkPref = await _preferencesManagement.getTheme();
    } catch (_) {
      _preferencesManagement.setThemeInPref(isDark);
      _isDarkPref = isDark;
    }
    if (_isDarkPref != isDark) {
      isDark = _isDarkPref!;
      changeThemeData(isDark);
    }
  }

  void changeThemeData(bool dark) {
    userThemeMode = dark ? ThemeMode.dark : ThemeMode.light;
    _preferencesManagement.setThemeInPref(dark);
    isDark = dark;
    notifyListeners();
  }
}
