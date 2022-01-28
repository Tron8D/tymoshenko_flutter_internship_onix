import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/ui/screens/currencies_screen.dart';

import 'ui/screens/main_screen.dart';
import 'ui/screens/settings_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const MainScreen(),
  '/settings': (context) => SettingsScreen(),
  '/change_currency': (context) => CurrenciesScreen(
        onTap: () {},
      ),
};
