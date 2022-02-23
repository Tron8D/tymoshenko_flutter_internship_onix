import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_intership_onix/ui/providers/currencies_list_provider.dart';
import 'package:flutter_intership_onix/ui/providers/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _darkTheme = context.read<ThemeProvider>().isDark;
  List<String> items = ['15 sec', '30 sec', '1 min'];
  late String value =
      context.read<CurrenciesListProvider>().updateInterval ?? items.first;

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
        child: Column(
          children: [
            CheckboxListTile(
              activeColor: Theme.of(context).secondaryHeaderColor,
              title: const Text('Dark theme'),
              value: _darkTheme,
              onChanged: _onChanged,
              controlAffinity: ListTileControlAffinity.leading,
            ),
            ListTile(
              title: const Text('Update interval: '),
              trailing: DropdownButton<String>(
                value: value,
                items: items.map(_menuItem).toList(),
                onChanged: (newValue) {
                  setState(() {
                    value = newValue!;
                    context
                        .read<CurrenciesListProvider>()
                        .setUpdateInterval(newValue);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> _menuItem(String item) =>
      DropdownMenuItem<String>(value: item, child: Text(item));

  void _onSave() => Navigator.pop(context);

  void _onChanged(bool? value) async {
    _darkTheme = value!;
    context.read<ThemeProvider>().changeThemeData(value);
  }
}
