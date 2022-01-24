import 'package:flutter/material.dart';

import '../routes.dart';
import '../user_settings.dart';

void main() {
  runApp(const MyApp());
}

UserSettings userSettings = UserSettings();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter lesson 6',
      debugShowCheckedModeBanner: false,
      theme: userSettings.isDark(),
      initialRoute: "/",
      routes: routes,
    );
  }
}
