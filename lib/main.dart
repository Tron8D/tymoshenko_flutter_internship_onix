import 'package:flutter/material.dart';

import 'screens/main_screen.dart';
import 'text_to_update.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<TextToUpdateState> textToUpdateGlobalKey =
    GlobalKey<TextToUpdateState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter lesson 2',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}
