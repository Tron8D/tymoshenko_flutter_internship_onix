import 'package:flutter/material.dart';

import 'package:flutter_intership_onix/main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _darkTheme;

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

  void _onSave() => Navigator.pop(context, _darkTheme);

  void _onChanged(bool? value) async {
    setState(() {
      _darkTheme = value!;
    });
    await userSettings.setTheme(_darkTheme);
  }

  void _defaultTheme() =>
      _darkTheme = Theme.of(context).brightness == Brightness.dark;
}
