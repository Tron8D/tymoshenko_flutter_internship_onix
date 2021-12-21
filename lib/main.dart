import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'text_to_update.dart';

void main() {
  runApp(MyApp());
}

final GlobalKey<TextToUpdateState> textToUpdateGlobalKey =
  GlobalKey<TextToUpdateState>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter lesson 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
