import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/screens/main_screen.dart';
import 'package:flutter_intership_onix/screens/settings_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => MainScreen(),
  '/settings': (context) => SettingsScreen(),
};
