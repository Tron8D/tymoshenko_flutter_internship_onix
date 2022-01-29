import 'package:flutter/material.dart';

import '/main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkTheme = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _defaultTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Settings',
          style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: _onSave,
          ),
        ],
      ),
      body: Center(
        child: CheckboxListTile(
          activeColor: Theme.of(context).secondaryHeaderColor,
          title: const Text("Dark theme"),
          value: _darkTheme,
          onChanged: _onChanged,
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ),
    );
  }

  Future<void> _onSave() async {
    await userSettings.setTheme(_darkTheme);
    Navigator.pop(context, _darkTheme);
  }

  void _onChanged(bool? value) {
    setState(() {
      _darkTheme = value!;
    });
  }

  Future<void> _defaultTheme() async {
    _darkTheme = Theme.of(context).brightness == Brightness.dark;
  }
}
