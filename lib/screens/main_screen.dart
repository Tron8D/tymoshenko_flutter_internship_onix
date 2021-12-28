import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/search_bar.dart';
import '../search_bar.dart';

// import '../main.dart';
// import '../text_to_update.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screenList = [
    Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(
          width: 2,
          color: Colors.black87,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 15,
            offset: Offset(0, 10),
          ),
        ],
      ),
      height: 250,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      margin: const EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      child: const Center(
        child: SearchBar(),
      ),
    ),
    OutlinedButton(
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.upload),
            Text(
              'Upload',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    ),
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
        title: Text(_titleList[_selectedIndex]),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: _selectedIndex,
        onTap: changeIndex,
      ),
    );
  }
}
