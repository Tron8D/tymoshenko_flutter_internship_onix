import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/screens/converter_screen.dart';
import 'package:flutter_intership_onix/screens/currencies_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screenList = [
    const ConverterScreen(),
    const CurrenciesScreen(),
  ];
  final List<String> _titleList = [
    'Converter',
    'Currencies',
  ];
  final List<BottomNavigationBarItem> _items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.calculate),
      label: 'Converter',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.attach_money),
      label: 'Currencies',
    ),
  ];

  //change index on bottom navigation bar.
  void changeIndex(int _newIndex) {
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
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          _titleList[_selectedIndex],
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).secondaryHeaderColor,
        items: _items,
        currentIndex: _selectedIndex,
        onTap: changeIndex,
      ),
    );
  }
}
