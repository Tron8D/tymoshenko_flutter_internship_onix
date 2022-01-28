import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/main.dart';
import 'converter_screen.dart';
import 'currencies_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screenList = [
    const ConverterScreen(),
    CurrenciesScreen(
      onTap: () {},
    ),
  ];

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/converter.svg',
        height: 25,
        color: Colors.black54,
      ),
      activeIcon: SvgPicture.asset(
        'assets/icons/converter.svg',
        height: 30,
        color: const Color(0xff4D3DAD),
      ),
      label: 'Converter',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/currencies.svg',
        height: 25,
        color: Colors.black54,
      ),
      activeIcon: SvgPicture.asset(
        'assets/icons/currencies.svg',
        height: 30,
        color: const Color(0xff4D3DAD),
      ),
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
    return StreamBuilder(
        stream: streams.themeStream(),
        builder: (context, snapshot) {
          return Scaffold(
            body: Center(
              child: _screenList[_selectedIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Theme.of(context).secondaryHeaderColor,
              items: _items,
              currentIndex: _selectedIndex,
              onTap: changeIndex,
            ),
          );
        });
  }
}
