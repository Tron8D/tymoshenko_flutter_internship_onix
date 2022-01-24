import 'package:flutter/material.dart';

import '../main.dart';

class SettingsScreen extends StatefulWidget {
  bool _darkTheme = userSettings.dark;
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: userSettings.isPrimaryColor(),
        title: Text(
          'Settings',
          style: TextStyle(
            color: userSettings.isSecondaryHeaderColor(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () {
              Navigator.pop(context, widget._darkTheme);
            },
          ),
        ],
      ),
      body: Center(
        child: CheckboxListTile(
          activeColor: userSettings.isSecondaryHeaderColor(),
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
