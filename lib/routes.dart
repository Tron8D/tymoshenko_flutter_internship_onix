import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/ui/screens/currencies_screen.dart';
import 'package:flutter_intership_onix/ui/screens/info_card_screen.dart';
import 'package:flutter_intership_onix/ui/screens/selectable_currencies_screen.dart';

import 'ui/screens/main_screen.dart';
import 'ui/screens/settings_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const MainScreen(),
  '/settings': (context) => const SettingsScreen(),
  '/change_currency': (context) => const CurrenciesScreen(),
  '/selectable_change_currency': (context) =>
      const SelectableCurrenciesScreen(),
  '/info_card_screen': (context) => const InfoCardScreen(),
};
