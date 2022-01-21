import 'package:flutter/material.dart';

import '../screens/main_screen.dart';
import '../screens/settings_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const MainScreen(),
  '/settings': (context) => SettingsScreen(),
};
