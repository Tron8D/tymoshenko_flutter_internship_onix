import 'package:flutter/material.dart';

import '../routes.dart';
import 'data/repository/currencies_repository.dart';
import 'data/source/streams/streams.dart';
import 'data/source/user_settings.dart';

void main() {
  runApp(const MyApp());
}

//create user app settings
final streams = Streams();
final UserSettings userSettings = UserSettings(streams);
final currenciesRepository = CurrenciesRepository();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    userSettings.getThemeFromPref();
    // userSettings.preferencesManagement.clearPref();
    return StreamBuilder(
        stream: streams.themeStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const MaterialApp(
              home: Scaffold(
                body: Text('Theme error!'),
              ),
            );
          } else {
            return MaterialApp(
              title: 'Flutter lesson 6',
              debugShowCheckedModeBanner: false,
              theme: userSettings.lightTheme,
              darkTheme: userSettings.darkTheme,
              themeMode: userSettings.isDark(),
              initialRoute: "/",
              routes: routes,
            );
          }
        });
  }
}
