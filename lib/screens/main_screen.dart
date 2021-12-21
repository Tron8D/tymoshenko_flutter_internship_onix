import 'package:flutter/material.dart';

import '../text_to_update.dart';
import '../main.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screenList = [
    TextToUpdate(key: textToUpdateGlobalKey,),
    Container(),
  ];
  final List<BottomNavigationBarItem> _items = [
    const BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Converter',),
    const BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Currencies',),
  ];

  //change index on bottom navigation bar.
  void changeIndex(int _newIndex){
    setState(() {
      _selectedIndex = _newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screenList[_selectedIndex],
      ),
      appBar: AppBar(
        title: const Text('Update'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => textToUpdateGlobalKey.currentState?.updateText(DateTime.now().toString()),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: _selectedIndex,
        onTap: changeIndex,
      ),
    );
  }
}
