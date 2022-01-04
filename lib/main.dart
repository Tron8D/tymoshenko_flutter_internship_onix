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
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: const Color(0xffa82c2c),
        cardColor: const Color(0xffffffff),
      ),
      home: const MainScreen(),
    );
  }
}
