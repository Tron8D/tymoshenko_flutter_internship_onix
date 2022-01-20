import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/main.dart';

class SettingsScreen extends StatefulWidget {
  bool _darkTheme = userSettings.light;
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _light;
  @override
  Widget build(BuildContext context) {
    print('build settings');
    _light = (ModalRoute.of(context)?.settings.arguments as bool) as bool;
    print('build $_light');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Settings'),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              _light = widget._darkTheme;
              print('widget.darkTheme $_light');
              Navigator.pop(context, widget._darkTheme);
            },
          ),
        ],
      ),
      body: Center(
        child: CheckboxListTile(
          title: Text("Dark theme"),
          value: widget._darkTheme,
          onChanged: (value) {
            setState(() {
              print("!!!");
              widget._darkTheme = value!;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ),
    );
  }
}
