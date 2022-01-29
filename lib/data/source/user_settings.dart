import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/data/models/converter.dart';
import 'package:flutter_intership_onix/main.dart';

import '/data/source/preferences_management.dart';
import '/ui/themes/dark_theme_data.dart';
import '/ui/themes/light_theme_data.dart';
import 'streams/streams.dart';

class UserSettings {
  Streams streams;
  UserSettings(this.streams) {
    loadThemeFromPref();
  }

  late Converter converter;
  final PreferencesManagement preferencesManagement = PreferencesManagement();

  // Future<bool> get isDarkTheme => streams.themeStream.last;

  Future<void> setTheme(bool dark) async {
    await preferencesManagement.setThemeInPref(dark);
    streams.setThemeInStream(dark);
    print('SetTheme $dark');
  }

  Future<void> setTopCard(int id) async {
    await preferencesManagement.setTopCardId(id);
    streams.setTopCardInStream(id);
    print('Top ID $id');
  }

  Future<void> setBottomCard(int id) async {
    await preferencesManagement.setTopCardId(id);
    streams.setTopCardInStream(id);
    print('Bottom ID $id');
  }

  Future<void> loadThemeFromPref() async {
    if (currenciesRepository.currenciesList.isEmpty) {
      streams.currencyStreamSimulation();
    }
    final _isDark = await preferencesManagement.getTheme() ?? false;
    converter.topCardId = await preferencesManagement.getTopCardId() ?? 0;
    converter.bottomCardId = await preferencesManagement.getBottomCardId() ?? 1;

    await setTheme(_isDark);
    await setTopCard(converter.topCardId);
    await setBottomCard(converter.bottomCardId);
  }

  //description of application themes
  ThemeData lightTheme = lightThemeData();
  ThemeData darkTheme = darkThemeData();
}
