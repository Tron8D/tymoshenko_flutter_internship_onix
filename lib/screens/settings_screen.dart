import 'package:flutter/material.dart';

import '../main.dart';

class SettingsScreen extends StatefulWidget {
  bool _darkTheme = userSettings.dark;
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _light;
  @override
  Widget build(BuildContext context) {
    _light = (ModalRoute.of(context)?.settings.arguments as bool);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Settings',
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () {
              _light = widget._darkTheme;
              Navigator.pop(context, widget._darkTheme);
            },
          ),
        ],
      ),
      body: Center(
        child: CheckboxListTile(
          activeColor: Theme.of(context).secondaryHeaderColor,
          title: const Text("Dark theme"),
          value: widget._darkTheme,
          onChanged: (value) {
            setState(() {
              widget._darkTheme = value!;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ),
    );
  }
}
