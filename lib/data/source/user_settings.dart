import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/data/models/converter.dart';

import '/data/source/preferences_management.dart';
import '/ui/themes/dark_theme_data.dart';
import '/ui/themes/light_theme_data.dart';
import 'streams/streams.dart';

class UserSettings {
  Streams streams;
  UserSettings(this.streams);

  late Converter converter;
  final PreferencesManagement preferencesManagement = PreferencesManagement();
  bool dark = false;

  void setTheme(bool dark) {
    preferencesManagement.setThemeInPref(dark);
    streams.setThemeInStream(dark);
  }

  Future<void> getThemeFromPref() async {
    dark = await preferencesManagement.getTheme() ?? false;
  }

  //description of application themes
  ThemeData lightTheme = lightThemeData();
  ThemeData darkTheme = darkThemeData();

  //color selection based on the chosen theme
  ThemeMode isDark() => dark ? ThemeMode.dark : ThemeMode.light;
}
