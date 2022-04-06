import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intership_onix/routes.dart';
import 'package:flutter_intership_onix/ui/bloc/converter_bloc/converter_bloc.dart';
import 'package:flutter_intership_onix/ui/bloc/currencies_list_bloc/currencies_list_bloc.dart';
import 'package:flutter_intership_onix/ui/bloc/theme_bloc/theme_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_intership_onix/data/models/local/currency_hive_model.dart';
import 'package:flutter_intership_onix/ui/screens/splash_screen.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => ThemeBloc()),
        BlocProvider(create: (BuildContext context) => ConverterBloc()),
        BlocProvider(create: (BuildContext context) => CurrenciesListBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (bloc, state) {
          return MaterialApp(
            title: 'Flutter lesson 10',
            debugShowCheckedModeBanner: false,
            theme: bloc.watch<ThemeBloc>().lightTheme,
            darkTheme: bloc.watch<ThemeBloc>().darkTheme,
            themeMode: bloc.watch<ThemeBloc>().isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            initialRoute: "/",
            routes: routes,
          );
        },
      ),
    );
  }
}

// Widget build(BuildContext context) {
//   // userSettings.preferencesManagement.clearPref();
//   return MultiProvider(
//     providers: [
//       ChangeNotifierProvider<CurrenciesListProvider>(
//           create: (context) => CurrenciesListProvider()),
//       ChangeNotifierProvider<ConverterProvider>(
//           create: (context) => ConverterProvider()),
//       ChangeNotifierProvider(
//         create: (context) => ThemeProvider(),
//       )
//     ],
//     child: Consumer<ThemeProvider>(
//       builder: (context, themeProvider, _) {
//         return MaterialApp(
//           title: 'Flutter lesson 10',
//           debugShowCheckedModeBanner: false,
//           theme: themeProvider.lightTheme,
//           darkTheme: themeProvider.darkTheme,
//           themeMode: context.watch<ThemeProvider>().userThemeMode,
//           initialRoute: "/",
//           routes: routes,
//         );
//       },
//     ),
//   );
// }
