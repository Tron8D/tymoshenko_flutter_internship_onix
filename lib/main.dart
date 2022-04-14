import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_intership_onix/routes.dart';
import 'package:flutter_intership_onix/ui/bloc/converter_bloc/converter_bloc.dart';
import 'package:flutter_intership_onix/ui/bloc/currencies_list_bloc/currencies_list_bloc.dart';
import 'package:flutter_intership_onix/ui/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_intership_onix/data/models/local/currency_hive_model.dart';
import 'package:flutter_intership_onix/ui/bloc/auth_bloc/auth_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  Hive.registerAdapter(CurrencyHiveModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => CurrenciesListBloc(),
          lazy: false,
        ),
        BlocProvider(
          create: (BuildContext context) => ConverterBloc(),
        ),
        BlocProvider(create: (BuildContext context) => ThemeBloc()),
        BlocProvider(create: (BuildContext context) => AuthBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter lesson 12',
            debugShowCheckedModeBanner: false,
            theme: context.read<ThemeBloc>().lightTheme,
            darkTheme: context.read<ThemeBloc>().darkTheme,
            themeMode: context.read<ThemeBloc>().isDark
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
