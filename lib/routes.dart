import 'package:flutter/material.dart';

import 'package:flutter_intership_onix/ui/screens/currency_info_screen.dart';
import 'package:flutter_intership_onix/ui/screens/main_screen.dart';
import 'package:flutter_intership_onix/ui/screens/settings_screen.dart';
import 'package:flutter_intership_onix/ui/screens/splash_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const SplashScreen(),
  '/main': (context) => const MainScreen(),
  '/settings': (context) => const SettingsScreen(),
  // '/selectable_change_currency': (context) =>
  //     const SelectableCurrenciesScreen(),
  // '/info_card_screen': (context) => const CurrencyInfoScreen(),
};
