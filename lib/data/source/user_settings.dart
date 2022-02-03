import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_intership_onix/data/models/converter.dart';
import 'package:flutter_intership_onix/data/source/preferences_management.dart';
import 'package:flutter_intership_onix/data/source/streams/streams.dart';
import 'package:flutter_intership_onix/ui/themes/dark_theme_data.dart';
import 'package:flutter_intership_onix/ui/themes/light_theme_data.dart';

class UserSettings {
  Streams streams;
  Converter converter = Converter(topCardId: 0, bottomCardId: 1);
  final PreferencesManagement preferencesManagement = PreferencesManagement();

  UserSettings(this.streams) {
    loadFromPref();
  }

  //Load preference from disk and add values in streams
  Future<void> loadFromPref() async {
    final _isDark = await preferencesManagement.getTheme() ?? false;

    converter.topCardId = await preferencesManagement.getTopCardId() ?? 0;
    converter.bottomCardId = await preferencesManagement.getBottomCardId() ?? 1;

    await setTheme(_isDark);
    await setTopCard(converter.topCardId);
    await setBottomCard(converter.bottomCardId);
  }

  Future<void> setTheme(bool dark) async {
    await preferencesManagement.setThemeInPref(dark);
    streams.setThemeInStream(dark);
  }

  Future<void> setTopCard(int id) async {
    await preferencesManagement.setTopCardId(id);
    streams.setTopCardInStream(id);
    converter.topCardId = id;
  }

  Future<void> setBottomCard(int id) async {
    await preferencesManagement.setBottomCardId(id);
    streams.setBottomCardInStream(id);
    converter.bottomCardId = id;
  }

  //Switch top and bottom cards
  Future<void> switchCard(Converter converter) async {
    int _topCardId = converter.topCardId;
    int _bottomCardId = converter.bottomCardId;

    await setTopCard(_bottomCardId);
    await setBottomCard(_topCardId);
  }

  //description of application themes
  ThemeData lightTheme = lightThemeData();
  ThemeData darkTheme = darkThemeData();
}
