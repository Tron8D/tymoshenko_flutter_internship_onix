import 'package:flutter/material.dart';

import '../text_to_update.dart';
import '../main.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextToUpdate(key: globalKey),
      ),
      appBar: AppBar(
        title: Text('Update'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
            // onPressed: globalKey.currentState?.updateText(DateTime.now()),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [],
      ),
    );
  }
}
