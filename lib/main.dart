import 'package:flutter/material.dart';
import 'screens/main_sreen.dart';
import 'text_to_update.dart';

void main() {
  runApp(MyApp());
}

GlobalKey globalKey = GlobalKey<TextToUpdateState>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter lesson 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
