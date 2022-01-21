import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/routes.dart';
import 'package:flutter_intership_onix/user_settings.dart';

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
      title: 'Flutter lesson 5',
      debugShowCheckedModeBanner: false,
      theme:
          userSettings.dark ? userSettings.darkTheme : userSettings.lightTheme,
      initialRoute: "/",
      routes: routes,
    );
  }
}
