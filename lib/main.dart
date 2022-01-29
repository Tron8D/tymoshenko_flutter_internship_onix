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
final currenciesRepository = CurrenciesRepository(streams);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // userSettings.preferencesManagement.clearPref();
    return StreamBuilder<bool>(
        initialData: false,
        stream: streams.themeStream,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasError || !snapshot.hasData) {
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
              themeMode: snapshot.data! ? ThemeMode.dark : ThemeMode.light,
              initialRoute: "/",
              routes: routes,
            );
          }
        });
  }
}
