import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/data/source/preferences_management.dart';
import '/ui/themes/dark_theme_data.dart';
import '/ui/themes/light_theme_data.dart';

class UserSettings {
  final PreferencesManagement preferencesManagement = PreferencesManagement();
  bool dark = false;

  //description of application themes
  ThemeData lightTheme = lightThemeData();
  ThemeData darkTheme = darkThemeData();

  //color selection based on the chosen theme
  ThemeData isDark() => dark ? darkTheme : lightTheme;

  Color isPrimaryColor() =>
      dark ? darkTheme.primaryColor : lightTheme.primaryColor;

  Color isSecondaryHeaderColor() =>
      dark ? darkTheme.secondaryHeaderColor : lightTheme.secondaryHeaderColor;
}
