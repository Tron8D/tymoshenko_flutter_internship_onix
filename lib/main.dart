import 'package:flutter/material.dart';

import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter lesson 4',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xffEBEFF7),
        secondaryHeaderColor: const Color(0xff4D3DAD),
        scaffoldBackgroundColor: const Color(0xffDDE2F9),
        cardColor: const Color(0xffEBEFF7),
      ),
      home: const MainScreen(),
    );
  }
}
