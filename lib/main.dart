import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/data/models/local/currency_hive_model.dart';
import 'package:flutter_intership_onix/routes.dart';
import 'package:flutter_intership_onix/ui/providers/converter_provider.dart';
import 'package:flutter_intership_onix/ui/providers/currencies_list_provider.dart';
import 'package:flutter_intership_onix/ui/providers/theme_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CurrencyHiveModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // userSettings.preferencesManagement.clearPref();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CurrenciesListProvider>(
            create: (context) => CurrenciesListProvider()),
        ChangeNotifierProvider<ConverterProvider>(
            create: (context) => ConverterProvider()),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        )
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'Flutter lesson 9',
            debugShowCheckedModeBanner: false,
            theme: themeProvider.lightTheme,
            darkTheme: themeProvider.darkTheme,
            themeMode: context.watch<ThemeProvider>().userThemeMode,
            initialRoute: "/",
            routes: routes,
          );
        },
      ),
    );
  }
}
