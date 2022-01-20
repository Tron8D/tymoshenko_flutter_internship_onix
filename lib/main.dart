import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/routes.dart';
import 'package:flutter_intership_onix/user_settings.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

UserSettings userSettings = UserSettings();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter lesson 5',
      debugShowCheckedModeBanner: false,
      theme:
          userSettings.light ? userSettings.lightTheme : userSettings.darkTheme,
      initialRoute: "/",
      routes: routes,
      // home: const MainScreen(),
    );
  }
}
