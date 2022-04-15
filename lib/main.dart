import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_intership_onix/src/core/di.dart';
import 'package:flutter_intership_onix/src/data/model/local/currency_hive_model.dart';
import 'package:flutter_intership_onix/src/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_intership_onix/src/presentation/screens/auth/bloc/auth_bloc.dart';
import 'package:flutter_intership_onix/src/presentation/screens/converter/bloc/converter_bloc.dart';
import 'package:flutter_intership_onix/src/presentation/screens/currencies/bloc/currencies_list_bloc.dart';

import 'package:flutter_intership_onix/routes.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setUpServiceLocator();
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
            title: 'Flutter lesson 13',
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
