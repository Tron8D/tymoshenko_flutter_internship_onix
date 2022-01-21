import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';
import '../screens/converter_screen.dart';
import '../screens/currencies_screen.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          userSettings.dark ? userSettings.darkTheme : userSettings.lightTheme,
      home: Scaffold(
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
          actions: [
            IconButton(
              onPressed: () async {
                Future<dynamic> result = Navigator.pushNamed(
                    context, '/settings',
                    arguments: userSettings.dark);
                result
                    .then((value) => userSettings.dark = value as bool)
                    .then((value) => setState(() {}));
              },
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                // height: 10,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).secondaryHeaderColor,
          items: _items,
          currentIndex: _selectedIndex,
          onTap: changeIndex,
        ),
      ),
    );
  }
}
