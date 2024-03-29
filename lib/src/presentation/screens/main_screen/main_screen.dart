import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_intership_onix/src/presentation/screens/converter/converter_screen.dart';
import 'package:flutter_intership_onix/src/presentation/screens/currencies/currencies_screen.dart';
import 'package:flutter_intership_onix/src/utils/localization/localization.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    //List of icons for bottom navigation bar
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
        label: lang(context).converterScreenTitle,
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
        label: lang(context).currenciesScreenTitle,
      ),
    ];

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
  }

  //List of screens for bottom navigation bar
  final List<Widget> _screenList = [
    const ConverterScreen(),
    const CurrenciesScreen(),
  ];

  //change index on bottom navigation bar.
  void changeIndex(int _newIndex) {
    setState(() {
      _selectedIndex = _newIndex;
    });
  }
}
