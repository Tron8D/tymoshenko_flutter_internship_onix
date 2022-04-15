import 'package:flutter/material.dart';

import 'package:flutter_intership_onix/src/presentation/screens/auth/auth_screen.dart';
import 'package:flutter_intership_onix/src/presentation/screens/currency_info/currency_info_screen.dart';
import 'package:flutter_intership_onix/src/presentation/screens/main_screen/main_screen.dart';
import 'package:flutter_intership_onix/src/presentation/screens/settings/settings_screen.dart';
import 'package:flutter_intership_onix/src/presentation/screens/splash/splash_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const SplashScreen(),
  '/auth': (context) => const AuthScreen(),
  '/main': (context) => const MainScreen(),
  '/settings': (context) => const SettingsScreen(),
  '/info_card_screen': (context) => const CurrencyInfoScreen(),
};
